require 'rails_helper'

RSpec.describe Rental, type: :model do
  context 'validation' do
    it 'start date cannot be blank' do
      rental = Rental.new

      rental.valid?

      expect(rental.errors[:start_date]).to include('não pode ficar em branco')
    end

    it 'end date cannot be blank' do
      rental = Rental.new

      rental.valid?

      expect(rental.errors[:end_date]).to include('não pode ficar em branco')
    end

  end

  context 'Create code' do
    it 'should generate a code on create' do
      customer = Customer.create!(name: 'Lucas', email: 'test@test.com', cpf: '079.212.270-40')
      car_category = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
      rental = Rental.new(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, 
                          car_category: car_category)

      rental.save

      expect(rental.code).not_to be_blank
    end
  end
end
