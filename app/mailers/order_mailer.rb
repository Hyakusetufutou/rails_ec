# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def complete(order_id)
    @order = Order.find(order_id)
    email = @order.email
    @order_details = @order.order_details

    mail(to: email, subject: 'ご注文ありがとうございます')
  end
end
