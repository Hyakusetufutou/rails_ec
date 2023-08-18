# frozen_string_literal: true

class OrderDetailsController < ApplicationController
  before_action :basic_auth

  def index
    pp params[:id]
    @order_details = OrderDetail.where(order_id: params[:id]).page(params[:page]).order(:id)
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end
end
