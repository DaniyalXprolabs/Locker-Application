class PagesController < ApplicationController
  def home;end

  def toggle_role
    @user=User.find(params[:id])
    if @user.buyer?
      @user.seller!
    else
      @user.buyer!
    end
    redirect_to root_path
  end
end
