class ProductsController < ApplicationController
  def index
    @products = Product.includes(:user).all
  end
end
