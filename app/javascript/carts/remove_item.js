document.addEventListener("DOMContentLoaded", () => {
    const removeButtons = document.querySelectorAll(".remove-button");
  
    removeButtons.forEach((button) => {
      button.addEventListener("click", (event) => {
        event.preventDefault();
        
        const productId = button.dataset.productId;
  
        // Make an AJAX request to remove the item from the cart
        fetch(`/cart/remove_item?product_id=${productId}`, {
          method: "DELETE",
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