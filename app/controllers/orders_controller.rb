class OrdersController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @order = Order.new(price: @meal.price)
    @order.meal = @meal
    @order.status = "pending"
    @order.user = current_user
    if @order.save
      redirect_to dashboard_path, notice: 'Your order has been created'
    else
      render 'meals/show'
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to dashboard_path, notice: 'Order has been updated'
    else
      render 'dashboard/show'
    end
  end

  def order_params
    params.require(:order).permit(:price, :status)
  end
end
