# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :current_cart_total_item, :current_cart_items, only: %i[index create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.billing_amount = current_cart.total_price

    if current_cart.cart_items.empty? | !@order.save || !@order.register_order_details(current_cart.cart_items)
      render :index, status: :unprocessable_entity
      return
    end

    OrderMailer.complete(@order.id).deliver_later

    current_cart.destroy

    flash[:notice] = '購入ありがとうございます'
    redirect_to products_path 
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :lastname, :username, :email, :address, :address2, :country, :state,
                                  :zip, :cc_name, :cc_number, :cc_cvv, :cc_expiration)
  end

  def current_cart_items
    @cart_items = CartItem.where(cart_id: session[:cart_id]).order(:id)
  end
end
