class OrdersController < ApplicationController

  def show
    @order=Order.find(params[:id])
    @orderProducts=OrderProducts.where()
  end

  def new
    @order=Order.new
    @product = Product.find(params[:product_id])
    @order.order_products.build
    @order.order_products.product_id=@product.id
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
