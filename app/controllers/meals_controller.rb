class MealsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    if @meal.save
      redirect_to meals_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :price)
  end
end
