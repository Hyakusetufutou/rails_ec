class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes do |t|
      t.string :code, null: false, index: { unique: true, name: 'unique_promotion_code' }
      t.integer :reduced_rate, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
