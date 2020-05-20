class ChangeColumnInStocksTable < ActiveRecord::Migration[6.0]
  def up
    change_column :stocks, :available, :boolean, default: true
  end

  def down
    change_column :stocks, :available, :boolean, default: false
  end
end
