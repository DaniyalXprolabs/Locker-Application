class CartProductsController < ApplicationController
  before_action :getProduct, only: [:new]

  def new
    @cart_product = @cart.cart_products.new
    @cart_product.product_id = @product.id
    @cart_product.save
    redirect_to product_path(@product), notice: "Product add to the cart Successfully"
  end

  private
  def getCart
    @cart = current_user.cart
  end

  def getProduct
    @product = Product.find(params[:product_id])
  end
end
