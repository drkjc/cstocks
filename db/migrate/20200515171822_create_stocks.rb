class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.string :industry
      t.string :marketcap
      t.string :lastsale
      t.string :ipoyear
      t.string :sector
      t.string :summary_quote
      t.boolean :available, default: false

      t.timestamps
    end
  end
end
