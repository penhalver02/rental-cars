class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary
  validates :license_plate, :color, :car_model_id, :mileage, :subsidiary_id, presence: true
  validates :license_plate, uniqueness: true
  validates :mileage, numericality: {  greater_than: 0 }
end
