document.addEventListener("DOMContentLoaded", () => {
    const addToCartButtons = document.querySelectorAll(".add-to-cart-button");
  
    addToCartButtons.forEach((button) => {
      button.addEventListener("click", (event) => {
        event.preventDefault();
        
        const productId = button.dataset.productId;
        const quantityInput = document.querySelector(`#quantity-${productId}`);
        const quantity = parseInt(quantityInput.value);
  
        if (quantity > 0) {
          // Make an AJAX request to add the item to the cart
          fetch(`/cart/add_item?product_id=${productId}&quantity=${quantity}`, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
            },
          })
          .then((response) => response.json())
          .then((data) => {
            // Handle the response data accordingly
            console.log(data);
          })
          .catch((error) => {
            console.error(error);
          });
        }
      });
    });
  });