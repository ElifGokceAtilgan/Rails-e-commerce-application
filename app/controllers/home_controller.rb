class HomeController < ApplicationController
  def home
    @products = Product.all
  end
end
