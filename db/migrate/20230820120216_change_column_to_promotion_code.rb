class ChangeColumnToPromotionCode < ActiveRecord::Migration[7.0]
  def up
    remove_column :promotion_codes, :status, :integer
    add_reference :promotion_codes, :orders, foreign_key: true
    add_reference :promotion_codes, :carts, foreign_key: true
  end

  def down
    add_column :promotion_codes, :status, :integer, default: 0
    remove_reference :promotion_codes, :orders, foreign_key: true
    remove_reference :promotion_codes, :carts, foreign_key: true
  end
end
