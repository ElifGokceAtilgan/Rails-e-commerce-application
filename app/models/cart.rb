class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def quantity_of_product(product)
    cart_products.find_by(product_id: product.id).quantity
  end

  def total_quantity
    cart_products.sum(:quantity)
  end

end