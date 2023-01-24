module Api
  class DishesController < BaseController
    def index
      dishes = Dish.includes(:orders)
      render json: dishes.sort_by { |dish| dish.orders.size }.reverse, status: :ok
    end
  end
end
