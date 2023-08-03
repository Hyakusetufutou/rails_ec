# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :cart_session 

  def index
    @products = Product.page(params[:page])
    @cart_item = CartItem.new
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.order('id DESC').page(1).per(4)
  end

  private

  def cart_session
    if session[:cart_id]
      @cart_id = session[:cart]
    else 
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
