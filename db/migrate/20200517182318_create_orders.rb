class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :symbol
      t.string :name
      t.integer :number_of_shares, default: 0
      t.integer :share_price, default: 0
      t.integer :balance, default: 0

      t.timestamps
    end
  end
end
