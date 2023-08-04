
# frozen_string_literal: true

class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(cart_id: session[:cart_id])
    @total_item = current_cart.total_item
  end

  def create
    current_cart.add_item(params[:product_id], params[:quantity] )
    flash[:notice] = 'カートに追加しました'
    redirect_to request.referer 
  end

  def destroy
    @item = current_cart.cart_items.find(params[:id])
    @item.destroy
    flash[:notice] = 'カートから削除しました'
    redirect_to request.referer
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  end


end
