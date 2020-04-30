require 'rails_helper'

RSpec.describe CarCategory, type: :model do
  context 'validation' do
    it 'name cannot be blank' do
      car_category = CarCategory.new

      car_category.valid?

      expect(car_category.errors[:name]).to include('não pode ficar em branco')
    end

    it 'daily rate cannot be blank' do
      car_category = CarCategory.new

      car_category.valid?

      expect(car_category.errors[:daily_rate]).to include('não pode ficar em branco')
    end

    it 'car insurance cannot be blank' do
      car_category = CarCategory.new

      car_category.valid?

      expect(car_category.errors[:car_insurance]).to include('não pode ficar em branco')
    end

    it 'third part insurance cannot be blank' do
      car_category = CarCategory.new

      car_category.valid?

      expect(car_category.errors[:third_part_insurance]).to include('não pode ficar em branco')
    end

    it 'daily rate must be greater than 0' do
      car_category = CarCategory.new(daily_rate: -10)

      car_category.valid?
      
      expect(car_category.errors[:daily_rate]).to include('deve ser maior que 0')
    end
    
    it 'car insurance must be greater than 0' do
      car_category = CarCategory.new(car_insurance: -20)

      car_category.valid?

      expect(car_category.errors[:car_insurance]).to include('deve ser maior que 0')
    end

    it 'third part insurance must be greater than 0' do
      car_category = CarCategory.new(third_part_insurance: -30)

      car_category.valid?
      
      expect(car_category.errors[:third_part_insurance]).to include('deve ser maior que 0')
    end
  end
end
