# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    if order.save 
      flash[:notice] = '購入ありがとうございます'
      redirect_to products_path
    else
      render cart_items_path, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :lastname, :username, :email, :address, :address2, :country, :state, :zip, :cc_name, :cc_number, :cc_expiration, :cc_cvv )
  end
end