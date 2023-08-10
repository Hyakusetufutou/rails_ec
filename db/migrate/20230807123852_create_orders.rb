# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :address2
      t.string :country, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :cc_name, null: false
      t.string :cc_number, null: false
      t.string :cc_expiration, null: false
      t.string :cc_cvv, null: false
      t.integer :billing_amount, null: false

      t.timestamps
    end
  end
end
