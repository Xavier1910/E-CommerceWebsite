// console.clear();

let id = location.search.split("?")[1];

if (sessionStorage.getItem("counter")) {
  let counter = sessionStorage.getItem("counter");
  document.getElementById("badge").innerText = counter;
}

function dynamicContentDetails(ob) {
  let mainContainer = document.createElement("div");
  mainContainer.id = "containerD";
  document.getElementById("containerProduct").appendChild(mainContainer);

  let imageSectionDiv = document.createElement("div");
  imageSectionDiv.id = "imageSection";

  let imgTag = document.createElement("img");
  imgTag.id = "imgDetails";
  //imgTag.id = ob.photos
  imgTag.src ="http://localhost:8080/products/files/"+ ob.preview;

  imageSectionDiv.appendChild(imgTag);

  let productDetailsDiv = document.createElement("div");
  productDetailsDiv.id = "productDetails";

  // console.log(productDetailsDiv);

  let h1 = document.createElement("h1");
  let h1Text = document.createTextNode(ob.name);
  h1.appendChild(h1Text);

  let h4 = document.createElement("h4");
  let h4Text = document.createTextNode(ob.brand);
  h4.appendChild(h4Text);

  let detailsDiv = document.createElement("div");
  detailsDiv.id = "details";

  let h3DetailsDiv = document.createElement("h3");
  let h3DetailsText = document.createTextNode("Rs " + ob.price);
  h3DetailsDiv.appendChild(h3DetailsText);

  let h3 = document.createElement("h3");
  let h3Text = document.createTextNode("Description");
  h3.appendChild(h3Text);

  let para = document.createElement("p");
  let paraText = document.createTextNode(ob.description);
  para.appendChild(paraText);

  let productPreviewDiv = document.createElement("div");
  productPreviewDiv.id = "productPreview";

  let h3ProductPreviewDiv = document.createElement("h3");
  let h3ProductPreviewText = document.createTextNode("Product Preview");
  h3ProductPreviewDiv.appendChild(h3ProductPreviewText);
  productPreviewDiv.appendChild(h3ProductPreviewDiv);
  let productArray=ob.photos.split(",");
  
  let i;
  for (i = 0; i < productArray.length; i++) {
    let imgTagProductPreviewDiv = document.createElement("img");
    imgTagProductPreviewDiv.id = "previewImg";
    imgTagProductPreviewDiv.src =  "http://localhost:8080/products/files/"+productArray[i];
    imgTagProductPreviewDiv.onclick = function (event) {
      imgTag.src = ob.photos[i];
      document.getElementById("imgDetails").src = this.src;
    };
    productPreviewDiv.appendChild(imgTagProductPreviewDiv);
  }

  let buttonDiv = document.createElement("div");
  buttonDiv.id = "button";

  let buttonTag = document.createElement("button");
  buttonDiv.appendChild(buttonTag);

  buttonText = document.createTextNode("Add to Cart");
  buttonTag.onclick = function () {
    let order = [id]; // Initialize order array
    let counter = 1;

    if (sessionStorage.getItem("cartItems")) {
        let existingOrder = sessionStorage.getItem("cartItems").split(" ");
        order = [id, ...existingOrder];
        counter = existingOrder.length + 1;
    }

    sessionStorage.setItem("cartItems", order.join(" "));
    sessionStorage.setItem("counter", counter);

    document.getElementById("badge").innerText = counter;
};

  buttonTag.appendChild(buttonText);

  mainContainer.appendChild(imageSectionDiv);
  mainContainer.appendChild(productDetailsDiv);
  productDetailsDiv.appendChild(h1);
  productDetailsDiv.appendChild(h4);
  productDetailsDiv.appendChild(detailsDiv);
  detailsDiv.appendChild(h3DetailsDiv);
  detailsDiv.appendChild(h3);
  detailsDiv.appendChild(para);
  productDetailsDiv.appendChild(productPreviewDiv);

  productDetailsDiv.appendChild(buttonDiv);

  return mainContainer;
}

// BACKEND CALLING
fetch(`http://localhost:8080/products/${id}`)
  .then(response => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    return response.json(); // Parse JSON response
  })
  .then(contentDetails => {
    console.log(contentDetails);
    dynamicContentDetails(contentDetails);
  })
  .catch(error => {
    console.error("Error fetching product details:", error);
  });

