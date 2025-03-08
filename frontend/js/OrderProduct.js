console.clear();

let cartContainer = document.getElementById("cartContainer");
let boxContainerDiv = document.createElement("div");
boxContainerDiv.id = "boxContainer";

var orders=[];
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
  `;

  let existingProduct = orders.find(item => item.id === product.id);
  if (existingProduct) {
      existingProduct.quantity += itemCounter;
      existingProduct.price = product.price * existingProduct.quantity;
  } else {
      orders.push({ productId: product.id, quantity: itemCounter, price: product.price * itemCounter });
  }

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
    <h5 id="ProductAmount"></h5>
    <h5>Delivery Charge: Rs.120</h5>
    <h4 id="totalAmount"></h4>
    <button id="placeOrderBtn" onclick="placeOrder()">Place Order</button>
  `;

totalContainerDiv.appendChild(totalDiv);

function amountUpdate(amount) {
  let total = document.getElementById(`totalAmount`);
  let ProductAmount = document.getElementById(`ProductAmount`);
  let totalAmount=parseInt(amount+120)
  sessionStorage.setItem("totalAmount", totalAmount);
  ProductAmount.innerText = "Product Amount: Rs " + amount;
  total.innerText = "Total Amount: Rs " + totalAmount;
}


function placeOrder() {
  let cartItems = sessionStorage.getItem("cartItems")
      ? sessionStorage.getItem("cartItems").split(" ")
      : [];

  if (cartItems.length === 0) {
      alert("No items in the cart to place order");
      return;
  }

  let userId = sessionStorage.getItem("userId");
  if (!userId) {
      alert("User not logged in!");
      return;
  }

  let totalAmount = sessionStorage.getItem("totalAmount");

  let OrderDetails = {
      userId: userId,
      totalAmount: totalAmount,
      orderProducts: orders
  };

  // console.log(OrderDetails);

  fetch("http://localhost:8080/orders/placeOrder", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(OrderDetails)
})
.then(response => response.text()) 
.then(data => {
      sessionStorage.removeItem("cartItems");
      sessionStorage.removeItem("totalAmount");
      sessionStorage.setItem("counter", 0);
      // alert("Order placed successfully!");
      showToast("Order Placed Successfully", true);
                setTimeout(() => {
                  window.location.href = "orderPlaced.html";
                }, 1500);
})
.catch(error => {
    console.error("Error placing order:", error);
});

}

function showToast(message, isSuccess = true) {
  const toast = document.getElementById("toast");
  toast.innerText = message;
  toast.style.backgroundColor = isSuccess ? "green" : "red";
  toast.classList.add("show");
  setTimeout(() => {
      toast.classList.remove("show");
  }, 3000);
}

fetch("http://localhost:8080/products")
  .then((response) => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    return response.json(); 
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
