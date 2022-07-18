class PagesController < ApplicationController
  def home
    @products = Product.all
  end

  def toggle_role
    @user = User.find(params[:id])
    if @user.buyer?
      @user.seller!
    else
      @user.buyer!
    end
    redirect_to profile_path(@user)
  end

  def profile
    @products = Product.where('user_id = ?',current_user.id)
    @orders = Order.where('user_id = ?', current_user.id)
    @cart = current_user.cart
  end
end
