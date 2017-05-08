class ProductsController < ApplicationController
  def index
    @products = Product.includes(:user).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = User.first.products.build(params.require(:product).permit(:name, :price))
    if @product.save
      redirect_to products_path, notice: "Created"
    else
      render :new, notice: "Can't create"
    end
  end

  private
    def product_param
      
    end
end
