# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :basic_auth
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
        flash[:notice] = '作成しました'
        redirect_to admin_products_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        flash[:notice] = '更新しました'
        redirect_to admin_products_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.delete

      flash[:notice] = '削除しました'
      redirect_to admin_products_path
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :image)
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
