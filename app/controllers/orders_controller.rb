class OrdersController < ApplicationController
  before_action :getOrderId, only: [:show, :destroy]
  before_action :getCart, only: [:new, :show]
  def index
    @orders = Order.all
    @pending_orders=Order.where("status = ?",0).count
    @delivered_orders=Order.where("status = ?",1).count
  end

  def new
    @order = Order.new()
    @product = Product.find(params[:product_id])
    @order.product_ids = @product.id
    @order.total=@product.price
    @order.user_id = current_user.id
    @order.save
    redirect_to profile_path
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
