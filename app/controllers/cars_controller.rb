class CarsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create]
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @subsidiaries = Subsidiary.all
    @car_models = CarModel.all
  end

  def new
    @car = Car.new
    @subsidiaries = Subsidiary.all
    @car_models = CarModel.all
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      @subsidiaries = Subsidiary.all
      @car_models = CarModel.all
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id)
  end
end