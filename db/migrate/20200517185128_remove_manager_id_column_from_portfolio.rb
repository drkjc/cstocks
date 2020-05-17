class RemoveManagerIdColumnFromPortfolio < ActiveRecord::Migration[6.0]
  def down
    add_column :portfolios, :manager_id, :integer 
  end

  def up
    remove_column :portfolios, :manager_id
  end
end
