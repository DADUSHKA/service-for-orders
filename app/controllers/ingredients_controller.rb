class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def update
    ingredient = Ingredient.find(params[:id])

    ingredient.update(ingredient_params)
  end

  private

  def ingredient_params
    params.permit(:id, :available)
  end
end
