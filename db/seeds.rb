# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# SmarterCSV.process(Rails.root.join('lib/tasks/NYSEcompanylist.csv'), headers: true) do |stock|
#     Stock.create(stock)
# end

# SmarterCSV.process(Rails.root.join('lib/tasks/NASDAQcompanylist.csv'), headers: true) do |stock|
#     Stock.create(stock)
# end

SmarterCSV.process(Rails.root.join('lib/tasks/AMEXcompanylist.csv'), headers: true) do |stock|
    Stock.create(stock)
end
