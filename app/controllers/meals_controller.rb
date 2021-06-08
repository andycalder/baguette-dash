class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
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
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @meal.update(meal_params)

    if @meal.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to dashboard_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :description, :price, :photo)
  end
end
