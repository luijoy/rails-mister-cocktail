# SH: Seed cocktails

puts '> '
puts '> '
puts '> ### SEEDING INGREDIENTS ###'

require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data_serialized = open(url).read
data = JSON.parse(data_serialized)

data['drinks'].each do |drink|
  puts drink['strIngredient1']
  Ingredient.create(name: drink['strIngredient1'])
end

20.times do
  cocktail = Cocktail.new(
    name: Faker::Science.element,
    )
  cocktail.save
end