class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :symbol
      t.string :name
      t.integer :number_of_shares
      t.integer :share_price
      t.integer :balance

      t.timestamps
    end
  end
end
