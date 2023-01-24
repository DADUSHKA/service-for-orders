require "yaml"

path = File.expand_path(".", "db/menu.yml")
menu = YAML.load_file(path)

warn "Creating list of ingredients"
menu["ingredients"].each do |name|
  Ingredient.create!(name: name)
end

warn "Creating list of dishes"
menu["dishes"].each do |kit|
  dish = Dish.create!(name: kit["name"])
  dish.ingredients << Ingredient.where(name: kit["ingredients"])
end
