
class CartsController < ApplicationController
  def update
    cart = Cart.find(params[:id])
    promotion_code = PromotionCode.find_by(code: promotion_code_params[:promotion_code])

    if promotion_code&.unused? && cart.more_than_reduced_rate?(promotion_code.reduced_rate)
      cart.promotion_code_id = promotion_code.id
      cart.save
      flash[:notice] = 'プロモーションコードを適用しました'
    else 
      flash[:alert] = 'プロモーションコードの適用に失敗しました'
    end

    redirect_to request.referer
  end

  private

  def promotion_code_params
    params.require(:cart).permit(:promotion_code)
  end
end