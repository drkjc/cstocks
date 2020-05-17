class AddColumnToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :manager_id, :integer
  end
end
