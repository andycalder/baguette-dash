class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
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
