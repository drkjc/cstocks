class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :purchase_price, :string, default: "0"
  end
end
