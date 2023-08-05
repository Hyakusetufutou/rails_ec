# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cart_session

  private

  def cart_session
    if !Cart.find_by(id: session[:cart_id])
      cart = Cart.create
      session[:cart_id] = cart.id
    end
  end

  def current_cart
    Cart.find(session[:cart_id])
  end

  def current_cart_total_item
    @total_item = current_cart.total_item
  end
end
