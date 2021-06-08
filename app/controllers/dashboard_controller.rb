class DashboardController < ApplicationController
  def show
    @orders = Order.all
    @meals = Meal.where( user: current_user )
  end
end
