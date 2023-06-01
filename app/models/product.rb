class Product < ApplicationRecord
  belongs_to :cart
  
  # attr_accessor :name, :price, :description, :image_url
  # attribute :image_url, :string

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :stock, presence:true


end