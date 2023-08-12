# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cart_session

  private

  def cart_session
    return if Cart.find_by(id: session[:cart_id])

    cart = Cart.create
    session[:cart_id] = cart.id
  end

  def current_cart
    Cart.find(session[:cart_id])
  end

  def current_cart_total_item
    @total_item = current_cart.total_item
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user_name, password|
      # user_name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      true
    end
  end
end
