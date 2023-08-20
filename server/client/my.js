const contentBox = document.getElementById("contentBox")

async function GetTable() {
     const url = "http://localhost:3000/settlements";
     const response = await fetch(url);
     const data = await response.json();
     settlements = data.data;
   
     RenderTable();
}


function RenderTable() {
     let htmlElement = `
     <div class="justify-content-center">
         <button type="button" class="btn btn-dark" onclick="Addsettlement()"><i class="bi bi-plus-lg"></i></button>
     </div>
     
     <table class="table table-striped table-hover">
       <thead>
         <tr>
           <th>Name<button type="button" class="btn btn-dark btn-sm ms-2" onclick="SortByName()"><i class="bi bi-caret-down-fill"></i></button></th>
           <th>Lane<button type="button" class="btn btn-dark btn-sm ms-2" onclick="GetTable()"><i class="bi bi-caret-down-fill"></i></button></th>
           <th>Rank<button type="button" class="btn btn-dark btn-sm ms-2" onclick="SortByRank()"><i class="bi bi-caret-down-fill"></i></button></th>
           <th>Team<button type="button" class="btn btn-dark btn-sm ms-2" onclick="SortByTeam()"><i class="bi bi-caret-down-fill"></i></button></th>
         </tr>
       </thead>
       <tbody>
     `;
   
     for (const settlement of settlement) {
         htmlElement += `
         <tr>
           <td><button type="button" class="btn btn-light" data-bs-toggle="modal"
               data-bs-target="#info-modal" onclick="GetInfoModal(${settlement.countyId})">${settlement.settlement}</button></td>
           <td>${settlement.zipcode}</td>
           <td>${settlement.population}</td>
           <td><button type="button" class="btn btn-danger" onclick="DeletePlayer(${settlement.countyId})"><i class="bi bi-trash-fill"></i></button></td>
         </tr>
         `;
     }
   
     htmlElement += `
       </tbody>
     </table>
     `;
   
     contentBox.innerHTML = htmlElement;
}
   