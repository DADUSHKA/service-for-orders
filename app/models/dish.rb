class Dish < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :orders

  scope :inactive_dishes_for_order, lambda {
    joins(:ingredients).where("ingredients.available" => false).distinct.pluck(:name)
  }
end
