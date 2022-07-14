class CartProductsController < ApplicationController
  before_action :getProduct, only: [:new]
  before_action :getCart, only: [:new,:destroy]

  def new
    @cart_product = @cart.cart_products.new
    @cart_product.product_id = @product.id
    @cart_product.subtotal = @product.price * @cart_product.quantity
    @cart_product.save
    redirect_to product_path(@product), notice: "Product add to the cart Successfully"
  end

  def destroy
    @cart_product = @cart.cart_products.find(params[:id])
    @cart_product.destroy
    redirect_to cart_path, notice: "Product is removed successfully"
  end

  private
  def getCart
    @cart = current_user.cart
  end

  def getProduct
    @product = Product.find(params[:product_id])
  end
end
