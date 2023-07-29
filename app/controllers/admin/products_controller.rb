# frozen_string_literal: true

class Admin::ProductsController < ApplicationController

  before_action :set_product, only: %i[edit update destroy]

  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "作成しました"
      redirect_to admin_products_path 
    else
      redirect_to new_admin_product_path, flash: {
        product: @product,
        error_messages: @product.errors.full_messages
      }
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else 
      render :edit
    end
  end

  def destroy
    @product.delete

    redirect_to admin_products_path notice: "削除しました"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end