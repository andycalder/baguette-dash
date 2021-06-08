class OrdersController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @order = Order.new(price: @meal.price)
    @order.meal = @meal
    @order.user = current_user
    if @order.save
      redirect_to dashboard_path, notice: 'Your order has been created'
    else
      render 'meals/show'
    end
  end
end
