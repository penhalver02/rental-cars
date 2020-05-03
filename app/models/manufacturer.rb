class Manufacturer < ApplicationRecord
  has_many :car_models
  has_many :cars
  validates :name, uniqueness: true
  validates :name, presence: true
end
