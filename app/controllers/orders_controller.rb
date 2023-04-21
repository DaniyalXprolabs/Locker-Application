class OrdersController < ApplicationController
  before_action :getOrderId, only: [:show, :destroy]
  before_action :getCart, only: [:show]
  def index
    @orders = Order.all
    @pending_orders=Order.where("status = ?",0).count
    @delivered_orders=Order.where("status = ?",1).count
  end

  def new
    if params[:cart_id].present?
      @cart = Cart.find(params[:cart_id])
      @order = Order.new
      @order.user_id = current_user.id
      @order.products << @cart.products
      @cart.destroy
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
    else
      @order = Order.new()
      @product = Product.find(params[:product_id])
      @order.product_ids = @product.id
      @order.total=@product.price
      @order.user_id = current_user.id
    end
    @order.save
    redirect_to @order
  end

  def new_cart_order
    redirect_to root_path
  end

  def show; end
  
  def destroy
    @order.destroy
    redirect_to profile_path(@order.user_id)
  end

  private

  def order_params
    params.require(:order).permit(:user_id,:total,:product_ids)
  end

  def getOrderId
    @order=Order.find(params[:id])
  end

  def getCart
    @cart = current_user.cart
  end

end
