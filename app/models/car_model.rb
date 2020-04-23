class CarModel < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :car_category

  validates :name, :year, :manufacturer, :motorization, :car_category, :fuel_type, presence: {message: 'Todos atributos não podem ficar em branco'}
end
