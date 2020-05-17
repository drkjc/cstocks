class AddColumnsToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :name, :string
    add_column :portfolios, :balance, :integer, default: 0
  end
end
