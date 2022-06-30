class OrdersController < ApplicationController

  def show
    @order=Order.find(params[:id])
  end

  def new
    @order=Order.new
    @product = Product.find(params[:product_id])
  end
  
  def create
    @order=Order.new()
    @order.user_id=current_user.id
    @order.save
    redirect_to @order
  end

end
