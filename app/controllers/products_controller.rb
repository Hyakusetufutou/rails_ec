# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :current_cart_total_item

  def index
    @products = Product.active.page(params[:page])
    @cart_item = CartItem.new
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.active.order('id DESC').page(1).per(4)
  end
end
