class CartsController < ApplicationController
  before_action :getCart
  
  def show
    @cart = current_user.cart
  end

  private
  def getCart
    @cart = current_user.cart
  end
end
