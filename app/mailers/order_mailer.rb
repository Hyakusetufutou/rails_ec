class OrderMailer < ApplicationMailer
  def complete(args)
    email = args[:email]
    @detail = args
    mail(to: email, subject: 'ご購入ありがとうございます。')
  end
end
