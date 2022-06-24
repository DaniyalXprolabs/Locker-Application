class PagesController < ApplicationController
  def home
    @products=Product.all
  end

  def toggle_role
    @user=User.find(params[:id])
    if @user.buyer?
      @user.seller!
    else
      @user.buyer!
    end
    redirect_to profile_page_path(@user)
  end

  def profile
    @products=Product.where("user_id =?",current_user.id)
  end
end
