class CreateDishesAndIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.boolean "available", default: true
      t.timestamps
    end

    create_table :dishes do |t|
      t.string :name
      t.timestamps
    end

    create_table :dishes_ingredients, id: false do |t|
      t.belongs_to :ingredient
      t.belongs_to :dish
    end

    create_table :dishes_orders, id: false do |t|
      t.belongs_to :order
      t.belongs_to :dish
    end    
  end
end
