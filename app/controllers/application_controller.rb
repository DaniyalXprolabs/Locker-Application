class ApplicationController < ActionController::Base
  include DeviseWhitelist

  def current_buyer
    if session[:user_id]
      @user=User.find(session[:user_id])
    end
  end

  def current_cart
    if user_signed_in?
      @cart = current_user.cart
    else
      if session[:cart]
        @cart = Cart.find(session[:cart])
      else
        @cart = Cart.create
        session[:cart] = @cart.id
      end
    end
  end

  def login
    !!current_user
  end
end
