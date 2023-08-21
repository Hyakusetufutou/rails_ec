# frozen_string_literal: true

class RemovePromotionCodeIdFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :carts, :promotion_codes
    remove_index :carts, column: :promotion_code_id
    remove_column :carts, :promotion_code_id, :bigint
  end
end
