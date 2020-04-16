class CarCategory < ApplicationRecord
  validates :name, uniqueness: {message: 'Nome deve ser único'}
  validates :name, :daily_rate, :car_insurance, :third_party_insurance, presence: {message: 'Todos atributos não podem ficar em branco'}
end
