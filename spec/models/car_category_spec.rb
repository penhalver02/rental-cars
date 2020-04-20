require 'rails_helper'

RSpec.describe CarCategory, type: :model do
  context 'validation' do
    it 'attribute cannot be blank' do
      car_category = CarCategory.new

      car_category.valid?

      expect(car_category.errors[:name]).to include('Todos atributos não podem ficar em branco')
      expect(car_category.errors[:daily_rate]).to include('Todos atributos não podem ficar em branco')
      expect(car_category.errors[:car_insurance]).to include('Todos atributos não podem ficar em branco')
      expect(car_category.errors[:third_part_insurance]).to include('Todos atributos não podem ficar em branco')
    end

    it 'name must be uniq' do
      CarCategory.create!(name: 'Hatch', daily_rate: 5.1,car_insurance: 300, third_part_insurance: 100)
      car_category = CarCategory.new(name: 'Hatch', daily_rate: 5.1,car_insurance: 300, third_part_insurance: 100)

      car_category.valid?

      expect(car_category.errors[:name]).to include('Nome deve ser único')
    end
  end
end
