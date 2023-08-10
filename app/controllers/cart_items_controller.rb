# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :current_cart_total_item, only: %i[index]
  before_action :set_cart_item, only: %i[destroy update]

  def index
    @cart_items = CartItem.where(cart_id: session[:cart_id]).order(:id)
    @order = Order.new
  end

  def create
    if current_cart.add_item(params[:product_id], params[:quantity].to_i)
      flash[:notice] = 'カートへ追加しました'
    else
      flash[:alert] = '問題が発生しました'
    end
    redirect_to request.referer
  end

  def destroy
    @item.destroy
    flash[:notice] = 'カートから削除しました'
    redirect_to request.referer
  end

  def update
    @item.increase(1) if params[:item_action] == 'increase'
    @item.decrease(1) if params[:item_action] == 'decrease'
    redirect_to request.referer
  end

  private

  def set_cart_item
    @item = current_cart.cart_items.find(params[:id])
  end
end
