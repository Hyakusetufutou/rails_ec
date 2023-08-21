# frozen_string_literal: true

class CartsController < ApplicationController

  def update
    cart = Cart.find(params[:id])
    promotion_code = PromotionCode.find_by(code: promotion_code_params[:promotion_code])

    if !promotion_code || promotion_code.order_id || cart.less_than_reduced_rate?(promotion_code.reduced_rate)
      flash[:alert] = 'プロモーションコードの適用に失敗しました'
    else
      cart.update(promotion_code: promotion_code)
      flash[:notice] = 'プロモーションコードを適用しました'
    end

    redirect_to request.referer
  end

  private

  def promotion_code_params
    params.require(:cart).permit(:promotion_code)
  end
end
