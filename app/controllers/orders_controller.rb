class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @dishes = Dish.where.not(name: Dish.inactive_dishes_for_order)
  end

  def create
    order = Order.new(title: Time.current.strftime("%Y-%m-%d %H:%M:%S"))
    dishes = Dish.where(id: order_params[:dish_ids])
    order.dishes << dishes

    if order.save
      redirect_to root_url, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy

    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private

  def order_params
    params.require(:order).permit(dish_ids: [])
  end
end
