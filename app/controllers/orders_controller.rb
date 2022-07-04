class OrdersController < ApplicationController
  before_action :getOrderId, only: [:show, :destroy]

  def index
    @orders = Order.all
    @pending_orders=Order.where("status = ?",0).count
    @delivered_orders=Order.where("status = ?",1).count
  end

  def new
    @order=Order.new()
    @order.user_id = current_user.id
    @product = Product.find(params[:product_id])
    @order.save
    redirect_to @order
  end

  def show
    #@product = Product.find(params[:product_id])
  end
  
  def destroy
    @order.destroy
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id,:total)
  end

  def getOrderId
    @order=Order.find(params[:id])
  end
end
