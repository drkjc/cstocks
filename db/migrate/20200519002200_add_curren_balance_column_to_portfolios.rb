class AddCurrenBalanceColumnToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :current_balance, :integer, default: 0
  end
end
