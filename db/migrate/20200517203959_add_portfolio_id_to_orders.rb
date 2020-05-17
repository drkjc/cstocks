class AddPortfolioIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :portfolio_id, :integer
  end
end
