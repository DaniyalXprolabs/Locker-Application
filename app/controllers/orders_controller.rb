class OrdersController < ApplicationController

  def show
    @order=Order.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @order=Order.new
  end
  
  def create
    @order=Order.create()
    @order.user_id=current_user.id
    @order.total=0
    @order.save
  end

end
