console.clear();

let contentTitle;

function dynamicClothingSection(ob) {
  let boxDiv = document.createElement("div");
  boxDiv.id = "box";

  boxDiv.innerHTML = `
      <a href="/contentDetails.html?${ob.id}">
          <img src="http://localhost:8080/products/files/${ob.preview}" alt="${ob.name}">
          <div id="details">
              <h3>${ob.name}</h3>
              <h4>${ob.brand}</h4>
              <h4 id="price">Rs.${ob.price}</h4>
          </div>
      </a>
  `;

  return boxDiv;
}


let mainContainer = document.getElementById("mainContainer");
let ShoesContainer = document.getElementById("ShoesContainer");
let HandbagContainer = document.getElementById("HandbagContainer");
let WatchesContainer = document.getElementById("WatchesContainer");


let httpRequest = new XMLHttpRequest();

fetch("http://localhost:8080/products")
  .then(response => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    return response.json(); 
  }).then(contentTitle => {
    // console.log(contentTitle); 
    if (sessionStorage.getItem("counter")) {
      let counter = sessionStorage.getItem("counter");
      document.getElementById("badge").innerText = counter;
    }
    contentTitle.forEach(product => {
      if (product.category === "Watches") {
        WatchesContainer.appendChild(dynamicClothingSection(product));
      }else if (product.category === "HandBags") {
        HandbagContainer.appendChild(dynamicClothingSection(product));
      } else {
        ShoesContainer.appendChild(dynamicClothingSection(product));
      }
    });
  })
  .catch(error => {
    console.error("Fetch failed!", error);
  });

