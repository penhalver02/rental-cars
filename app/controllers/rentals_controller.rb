class RentalsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show]
  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @customers = Customer.all
    @car_categories = CarCategory.all
  end

  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      redirect_to @rental
    else
      @customers = Customer.all
      @car_categories = CarCategory.all
      render :new
    end
  end
  
  def show
    @rental = Rental.find(params[:id])
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :customer_id, :car_category_id)
  end
end