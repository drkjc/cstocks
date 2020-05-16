# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def self.build_stock(stock)
    stock.map do |name, value|
        attr_name = name.split(" ")[1].to_s.underscore
        attr_name == "type" ? attr_name = "industry" : nil
        stock_hash[attr_name] = value
    end
end

NYSEarr = SmarterCSV.process('NYSEcompanylist.csv').each do |stock|
    build_stock(stock)
end
    
AMEXarr = SmarterCSV.process('AMEXcompanylist.csv')
NASDAQarr = SmarterCSV.process('NASDAQcompanylist.csv')