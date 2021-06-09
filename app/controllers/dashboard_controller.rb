class DashboardController < ApplicationController
  def show
    @orders = Order.where(user: current_user)
    @all_orders = Order.all
    @meals = Meal.where(user: current_user)
  end
end
