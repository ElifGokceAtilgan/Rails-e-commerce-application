document.addEventListener("DOMContentLoaded", () => {
    const quantityInputs = document.querySelectorAll(".quantity-input");
  
    quantityInputs.forEach((input) => {
      input.addEventListener("change", (event) => {
        const productId = input.dataset.productId;
        const newQuantity = parseInt(input.value);
  
        // Make an AJAX request to update the quantity of the item in the cart
        fetch(`/cart/update_quantity?product_id=${productId}&quantity=${newQuantity}`, {
          method: "PATCH",
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
      });
    });
  });