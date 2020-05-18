class ChangeColumnInOrders < ActiveRecord::Migration[6.0]
  def up 
    change_column :orders, :share_price, :string, default: "0"
  end

  def down 
    change_column :orders, :share_price, :integer, default: 0
  end
end
