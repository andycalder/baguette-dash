class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @results = params[:query].present? ? Meal.search_by_name(params[:query]) : Meal.all
    @meals = Meal.all
    @markers = @meals.geocoded.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude
      }
    end
  end

  def show
    @marker = { lat: @meal.latitude, lng: @meal.longitude } if @meal.latitude && @meal.longitude
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
    params.require(:meal).permit(:name, :description, :price, :photo, :address)
  end
end
