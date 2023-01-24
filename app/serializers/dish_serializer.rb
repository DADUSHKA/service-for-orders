class DishSerializer < ActiveModel::Serializer
  attributes :name

  attribute :count do
    object.orders.size
  end
end
