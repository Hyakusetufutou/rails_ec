class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.limit(4).order('id DESC')
  end
end

