
# frozen_string_literal: true

class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(cart_id: session[:cart_id])
    @total_item = 0
    if @cart_items.present?
      @cart_items.each { |item| @total_item += item.quantity }
    end
    pp @cart_items
  end

  def create
    @cart = Cart.find(session[:cart_id])
    pp params[:quantity]
    @cart.add_item(params[:product_id], params[:quantity] )
    flash[:notice] = 'カートに追加しました'
    redirect_to request.referer 
  end

  def destroy
    @item = Cart.find(session[:cart_id]).cart_items.find(params[:id])
    @item.destroy
    flash[:notice] = 'アイテムを削除しました'
    redirect_to request.referer
  end


end
