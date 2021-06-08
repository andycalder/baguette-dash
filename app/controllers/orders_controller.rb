class OrdersController < ApplicationController
  def new
    @meal = Meal.find(params[:meal_id])
    @order = Order.new
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @order = Order.new(price: @meal.price)
    @order.meal = @meal
    @order.user = current_user
    @order.save

    redirect_to dashboard_path(@order)
  end
end
