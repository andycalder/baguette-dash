class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end
end
