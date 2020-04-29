class Manufacturer < ApplicationRecord
  has_many :car_models
  validates :name, uniqueness: true
  validates :name, presence: true
end
