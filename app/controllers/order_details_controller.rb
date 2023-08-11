# frozen_string_literal: true

class OrderDetailsController < ApplicationController
  before_action :basic_auth

  def index
    @order_details = OrderDetail.page(params[:page]).order(:id)
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end
end
