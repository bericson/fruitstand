class ApplicationController < ActionController::Base
  protect_from_forgery

  #helper_method :current_cart

  #def current_cart
  #  if session[:cart_id]
  #    @current_cart ||= Cart.find(session[:cart_id])
  #  else
  #    @current_cart = Cart.create
  #    session[:cart_id] = cart.id
  #  end
  #end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
