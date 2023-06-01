# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Product.create(name: "MEN BLACK TSHIRT",
#   price: 9.99,
#   description: "This is a black t-shirt for men", 
#   image_url: "https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-01.jpg"
# )
# Product.create(name: "KIDS BLUE DRESS",
#   price: 43.99,
#   description: "This is BLUE DRESS for kids",
#   image_url: "https://www.jiomart.com/images/product/600x750/rvyljxmyse/sagun-dresses-girls-light-blue-a-line-frock-7-8-yrs-kids-wear-girls-frock-kids-party-wear-clothing-accessories-baby-girls-dresses-frock-product-images-rvyljxmyse-0-202212010957.jpg"
# )

Product.create(name: "MEN COLORFUL SNEAKERS",
  price: 70.99,
  description: "This is COLORFUL sneakers for men",
  image_url: "https://www.highsnobiety.com/static-assets/thumbor/R5_BOH2dBtEwo-szpVqv4TBEBD0=/1200x800/www.highsnobiety.com/static-assets/wp-content/uploads/2019/09/04164648/custom-sneakers-good-bad-ugly-main.jpg"
)
Product.create(name: "PINK WOMEN BAG", price: 4700.99, description: "This is a PINK hand bag", image_url: "https://cdn.beymen.com/mnresize/596/830/productimages/3fvyzh22.l4k_IMG_01_2110090629109.jpg")

# product = Product.new(name: "MEN BLACK TSHIRT", price: 9.99, description: "This is a black t-shirt for men", image_url: "https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-01.jpg")
# product.save