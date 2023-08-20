class PromotionCodesController < ApplicationController
  before_action :basic_auth

  def index
    @promotion_codes = PromotionCode.page(params[:page]).per(20)
  end

end