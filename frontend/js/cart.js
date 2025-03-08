console.clear();

// Get counter from sessionStorage
if (sessionStorage.getItem("counter")) {
  let counter = sessionStorage.getItem("counter");
  document.getElementById("badge").innerText = counter;
}

let cartContainer = document.getElementById("cartContainer");
let boxContainerDiv = document.createElement("div");
boxContainerDiv.id = "boxContainer";

// DYNAMIC CODE TO SHOW SELECTED ITEMS IN CART
function dynamicCartSection(product, itemCounter) {
  let boxDiv = document.createElement("div");
  boxDiv.id = `box-${product.id}`;
  boxDiv.className = "box";

  boxDiv.innerHTML = `
        <div class="productImage">
            <img src="http://localhost:8080/products/files/${product.preview}" />
        </div>
        <div class="productDetails">
            <h3>${product.name}</h3>
            <h5>Quantity: ${itemCounter}</h5>
            <h4>Amount: Rs.${product.price}</h4>
            </div>
            <button class="remove-btn" onclick="removeItem(${product.id}, ${product.price}, ${itemCounter})">X</button>
        `;
        

  boxContainerDiv.appendChild(boxDiv);
  cartContainer.appendChild(boxContainerDiv);
  cartContainer.appendChild(totalContainerDiv);
}

let totalContainerDiv = document.createElement("div");
totalContainerDiv.id = "totalContainer";

let totalDiv = document.createElement("div");
totalDiv.id = "total";
totalDiv.innerHTML = `
    <h2>Total Amount</h2>
    <h4 id="totalAmount"></h4>
    <button id="placeOrderBtn" onclick="placeOrder()">Checkout</button>
  `;

totalContainerDiv.appendChild(totalDiv);

function amountUpdate(amount) {
  let total = document.getElementById(`totalAmount`);
  sessionStorage.setItem("totalAmount", amount);
  total.innerText = "Total Amount: Rs " + amount;
}

// REMOVE ITEM FUNCTION
function removeItem(productId, productPrice, itemCounter) {
  let itemBox = document.getElementById(`box-${productId}`);
  if (itemBox) {
    itemBox.remove();
  }

  let cartItems = sessionStorage.getItem("cartItems")
    ? sessionStorage.getItem("cartItems").split(" ")
    : [];
  let updatedItems = cartItems.filter((id) => Number(id) !== productId);
  let counter = updatedItems.length;

  sessionStorage.setItem("cartItems", updatedItems.join(" "));
  sessionStorage.setItem("counter", counter);
  let totalAmountInSession = sessionStorage.getItem("totalAmount");

  document.getElementById("badge").innerText = counter;
  document.getElementById("totalItem").innerText = "Total Items: " + counter;

  let totalAmount = totalAmountInSession - productPrice * itemCounter;
  amountUpdate(totalAmount);
}

function placeOrder() {
  let cartItems = sessionStorage.getItem("cartItems")
    ? sessionStorage.getItem("cartItems").split(" ")
    : [];

  if (cartItems.length === 0) {
    alert("No items in the cart to place order");
    return;
  }

  let order = {
    cartItems: cartItems,
    totalAmount: sessionStorage.getItem("totalAmount"),
  };
  
  sessionStorage.setItem("order",order)
  let userId = sessionStorage.getItem("userId");
  if (!userId) {
      window.location.href="userReg.html";
  }else{

    window.location.href="Address.html";
  }
    // Send order to backend
  //...
}

// BACKEND CALL
let httpRequest = new XMLHttpRequest();

fetch("http://localhost:8080/products")
  .then((response) => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    return response.json(); // Parse JSON response
  })
  .then((contentTitle) => {
    // console.log(contentTitle);

    let counter = sessionStorage.getItem("counter")
      ? Number(sessionStorage.getItem("counter"))
      : 0;
    document.getElementById("totalItem").innerText = "Total Items: " + counter;

    let item = sessionStorage.getItem("cartItems")
      ? sessionStorage.getItem("cartItems").split(" ")
      : [];
    // console.log(item);

    let processedItems = new Set();
    let totalAmount = 0;

    for (let i = 0; i < counter; i++) {
      let itemId = Number(item[i]);

      if (!processedItems.has(itemId)) {
        let itemCounter = item.filter((id) => Number(id) === itemId).length;
        processedItems.add(itemId);

        let product = contentTitle.find((prod) => prod.id === itemId);
        if (product) {
          totalAmount += Number(product.price) * itemCounter;
          dynamicCartSection(product, itemCounter);
        }
      }
    }
    amountUpdate(totalAmount);
  })
  .catch((error) => {
    console.error("Fetch failed!", error);
  });
