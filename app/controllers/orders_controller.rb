class OrdersController < ApplicationController

  def index
    @orders=Order.all
    @pending_orders=Order.where("status=?",0).count
    @delivered_orders=Order.where("status=?",1).count
  end

  def show
    @order=Order.find(params[:id])
  end

  def new
    @order=Order.new
    @product = Product.find(params[:product_id])
    @order.order_products.build
    @product = Product.find(params[:product_id])
    @order.order_products.first.product_id=@product.id
  end
  
  def create
    @order=Order.new(order_params)
    @order.user_id=current_user.id
    @order.save
    redirect_to @order
  end

  def order_params
    params.require(:order).permit(:total, order_products_attributes: [:product_id,:quantity,:subtotal])
  end
end
