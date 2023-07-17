# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe 'GET /show' do
    before do
      @product_test = Product.create!(
        name: 'test',
        price: 0,
        description: 'test description'
      )
    end

    it 'returns a 200 response' do
      get :show, params: { id: @product_test.id }
      expect(response).to have_http_status(:ok)
    end

    it 'responds' do
      get :show, params: { id: @product_test.id }
      expect(response).to be_successful
    end
  end
end
