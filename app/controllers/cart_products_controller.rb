class CartProductsController < ApplicationController
  before_action :getProduct, only: [:new]
  before_action :getCart, only: [:new, :destroy, :add_quantity, :remove_quantity]
  before_action :getCartProduct, only: [:destroy, :add_quantity, :remove_quantity]

  def new
    if @cart.products.include?(@product)
      @cart_product = @cart.cart_products.find_by(:product_id => @product.id)
      @cart_product.quantity += 1
    else
      @cart_product = @cart.cart_products.new
      @cart_product.product_id = @product.id
    end
    @cart_product.subtotal = @product.price * @cart_product.quantity
    @cart_product.save
    redirect_to product_path(@product), notice: "Product add to the cart Successfully"
  end

  def add_quantity
    @cart_product.quantity += 1
    @cart_product.subtotal = @cart_product.product.price * @cart_product.quantity
    @cart_product.save
    redirect_to cart_path(@cart), notice: "Product add to the cart Successfully"
  end

  def remove_quantity
    #@cart_product = CartProduct.find(params[:id])
    @cart_product.quantity -= 1
    @cart_product.subtotal = @cart_product.product.price * @cart_product.quantity
    @cart_product.save
    redirect_to cart_path(@cart), notice: "Product remove from cart Successfully"
  end

  def destroy
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

  def getCartProduct
    @cart_product = @cart.cart_products.find(params[:id])
  end
end
