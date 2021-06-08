class DashboardController < ApplicationController
  def show
    @orders = Order.all
    @meals = Meal.all
  end
end
