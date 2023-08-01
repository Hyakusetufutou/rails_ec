# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :cart_session 

  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.order('id DESC').page(1).per(4)
  end

  private

  def cart_session
    if session[:cart]
      @cart = session[:cart]
    else 
      @cart = Cart.create
      session[:cart] = @cart
    end
  end
end
