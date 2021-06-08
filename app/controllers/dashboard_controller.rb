class DashboardController < ApplicationController
  def show
    @orders = Order.where(user: current_user)
    @meals = Meal.where(user: current_user)
  end
end
