class CarsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @car_category = CarCategory.all
    @car_model = CarModel.all
  end
end