class AddManagerToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :manager, :boolean, default: false
  end
end
