class CarCategory < ApplicationRecord
  has_many :car_models
  validates :name, :daily_rate, :car_insurance, :third_part_insurance, presence: true
  #validates_numericality_of :daily_rate, greater_than: 0
  validates :daily_rate, :car_insurance, :third_part_insurance, numericality: {  greater_than: 0 }
end


