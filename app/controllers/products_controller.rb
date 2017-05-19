class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back
    flash[:notice] = "测试购物车"
  end


private

def product_params
  params.require(:product).permit(:title, :description, :price, :quantity, :image)
end
end