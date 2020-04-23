class CarCategory < ApplicationRecord
  has_many :car_models
  validates :name, uniqueness: {message: 'Nome deve ser único'}
  validates :name, :daily_rate, :car_insurance, :third_part_insurance, presence: {message: 'Todos atributos não podem ficar em branco'}
end
