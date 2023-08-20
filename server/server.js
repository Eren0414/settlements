require("dotenv").config();

const express = require("express");
const mysql = require("mysql");
const app = express();
const sanitizeHtml = require("sanitize-html");
const cors = require("cors");

const pool = require("./config/database.js");
const {
  sendingGet,
  sendingGetError,
  sendingGetById,
  sendingPost,
  sendingPut,
  sendingDelete,
  sendingInfo,
} = require("./config/sending.js");

//#region middlewares
app.use(express.json());

app.use(
  cors({
    origin: "*",
    methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  })
);
//#endregion middlewares

//#region cars
app.get("/settlements", (req, res) => {
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403)
      return;
    }
    const sql = "SELECT * FROM settlements";
    connection.query(sql, (error, results, fields) => {
      sendingGet(res, error, results);
    });
    connection.release();
  });
});

app.get("/settlements/:countyId", (req, res) => {
  const id = req.params.id;
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403)
      return;
    }
    //   const sql = `
    //   SELECT * FROM settlements
    // WHERE countyId = ${countyId}
    //   `;
    const sql = `
    SELECT * FROM settlements
  WHERE countyId = ?
  `;
    connection.query(sql, [id], (error, results, fields) => {
      sendingGetById(res, error, results, id)
    });
    connection.release();
  });
});

app.post("/settlements", (req, res) => {
  console.log(req.body);
  const newR = {
    name: mySanitizeHtml(req.body.name),
    licenceNumber: mySanitizeHtml(req.body.licenceNumber),
    hourlyRate: +mySanitizeHtml(req.body.hourlyRate),
  };

  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403);
      return;
    }
    const sql = `
    INSERT INTO settlements
      (settlement, zipcode, population)
      VALUES
      (?, ?, ?)
    `;
    connection.query(
      sql,
      [newR.name, newR.licenceNumber, newR.hourlyRate],
      (error, results, fields) => {
        sendingPost(res, error, results, newR);
      }
    );
    connection.release();
  });
});

//update
app.put("/settlements/:countyId", (req, res) => {
  const id = req.params.id;
  const newR = {
    settlement: mySanitizeHtml(req.body.settlement),
    zipcode: mySanitizeHtml(req.body.zipcode),
    population: +mySanitizeHtml(req.body.population),
  };
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403);
      return;
    }

    const sql = `
    UPDATE settlements SET
    settlement = ?,
    zipcode = ?,
    population = ?
    WHERE countyId = ?
  `;
    connection.query(
      sql,
      [newR.settlement, newR.zipcode, newR.population, id],
      (error, results, fields) => {
        sendingPut(res, error, results, id, newR)
      }
    );
    connection.release();
  });
});

app.delete("/settlements/:countyId", (req, res) => {
  const id = req.params.id;
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403);
      return;
    }

    const sql = `
    DELETE from settlements
  WHERE countyId = ?
  `;
    connection.query(sql, [id], (error, results, fields) => {
      sendingDelete(res, error, results, id)
    });
    connection.release();
  });
});

//#endregion cars

//#region trips
app.get("/countys", (req, res) => {
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403)
      return;
    }
    const sql = "SELECT * FROM countys";
    connection.query(sql, (error, results, fields) => {
      sendingGet(res, error, results);
    });
    connection.release();
  });
});

app.get("/countys/:id", (req, res) => {
  const id = req.params.id;
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403)
      return;
    }
    //   const sql = `
    //   SELECT * FROM countys
    // WHERE id = ${id}
    //   `;
    const sql = `
    SELECT * FROM countys
  WHERE id = ?
  `;
    connection.query(sql, [id], (error, results, fields) => {
      sendingGetById(res, error, results, id)
    });
    connection.release();
  });
});

app.post("/countys", (req, res) => {
  console.log(req.body);
  const newR = {
    countyName: mySanitizeHtml(req.body.countyName),
  };

  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403);
      return;
    }
    const sql = `
    INSERT INTO countys
      (countyName)
      VALUES
      (?)
    `;
    connection.query(
      sql,
      [newR.countyName],
      (error, results, fields) => {
        sendingPost(res, error, results, newR);
      }
    );
    connection.release();
  });
});

//update
app.put("/countys/:id", (req, res) => {
  const id = req.params.id;
  const newR = {
    countyName: mySanitizeHtml(req.body.countyName),
  };
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403);
      return;
    }

    const sql = `
    UPDATE countys SET
    countyName = ?,
    WHERE id = ?
  `;
    connection.query(
      sql,
      [newR.countyName, id],
      (error, results, fields) => {
        sendingPut(res, error, results, id, newR)
      }
    );
    connection.release();
  });
});

app.delete("/countys/:id", (req, res) => {
  const id = req.params.id;
  pool.getConnection(function (error, connection) {
    if (error) {
      sendingInfo(res, 0, "server error", [], 403);
      return;
    }

    const sql = `
    DELETE from countys
  WHERE id = ?
  `;
    connection.query(sql, [id], (error, results, fields) => {
      sendingDelete(res, error, results, id)
    });
    connection.release();
  });
});

//#endregion trips

function mySanitizeHtml(data) {
  return sanitizeHtml(data, {
    allowedTags: [],
    allowedAttributes: {},
  });
}

app.listen(process.env.APP_PORT, () => {
  console.log(`Data server, listen port: ${process.env.APP_PORT}`);
});
