# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    order.billing_amount = current_cart.total_price

    if current_cart.cart_items.empty?
      redirect_to request.referer
      return
    end

    if !order.save || !order.register_order_details(current_cart.cart_items)
      redirect_to request.referer
      return
    end

    current_cart.destroy

    flash[:notice] = '購入ありがとうございます'
    redirect_to products_path
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :lastname, :username, :email, :address, :address2, :country, :state,
                                  :zip, :cc_name, :cc_number, :cc_cvv, :cc_expiration)
  end
end
