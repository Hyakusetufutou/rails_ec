# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :current_cart_total_item, :current_cart_items, only: %i[new create]
  before_action :basic_auth, only: %i[index]

  def index
    @orders = Order.page(params[:page]).per(10).order(:id)
  end

  def new
    @order = Order.new
    @promotion_code = PromotionCode.new
    @cart = current_cart
  end

  def create
    @order = order_new

    if current_cart.cart_items.empty? || !@order.save || !@order.register_order_details(current_cart.cart_items)
      render :new, status: :unprocessable_entity
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

  def order_new
    order = Order.new(order_params)
    order.billing_amount = current_cart.billing_amount
    if current_cart.promotion_code_id
      order.promotion_code_id = current_cart.promotion_code_id
      PromotionCode.find(order.promotion_code_id).used!
    end
    order
  end

  def current_cart_items
    @cart_items = CartItem.where(cart_id: session[:cart_id]).order(:id)
    return if @cart_items

    current_cart.update(promotion_code_id: nil)
  end
end
