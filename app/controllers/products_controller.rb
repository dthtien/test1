class ProductsController < ApplicationController
  def index
    @products = Product.includes(:user).all
    # respond_to do |format|
    #   format.html # show default view
    #   format.json {render :json => @products}
    # end
  end

  def new
    @product = Product.new(price: 9)
  end

  def create
    @product = User.first.products.build(product_param)

    respond_to do |format|
      if @product.save
        format.html {redirect_to products_path, notice: "Created"}
        format.json{render :show, status: :created, location: @product}
      else
        format.html {render :new, notice: "Can't create"}
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end
  private
    def product_param
      params.require(:product).permit(:name, :price)
    end
end
