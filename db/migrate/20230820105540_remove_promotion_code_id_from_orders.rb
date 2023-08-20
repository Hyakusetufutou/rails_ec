class RemovePromotionCodeIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :orders, :promotion_codes
    remove_index :orders, column: :promotion_code_id 
    remove_column :orders, :promotion_code_id, :bigint
  end
end
