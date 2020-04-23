require 'rails_helper'

RSpec.describe CarModel, type: :model do
  context 'validation' do
    it 'attribute cannot be blank' do
      car_model = CarModel.new

      car_model.valid?

      expect(car_model.errors[:name]).to include('Todos atributos não podem ficar em branco')
      expect(car_model.errors[:year]).to include('Todos atributos não podem ficar em branco')
      expect(car_model.errors[:manufacturer]).to include('Todos atributos não podem ficar em branco')
      expect(car_model.errors[:motorization]).to include('Todos atributos não podem ficar em branco')
      expect(car_model.errors[:car_category]).to include('Todos atributos não podem ficar em branco')
      expect(car_model.errors[:fuel_type]).to include('Todos atributos não podem ficar em branco')
    end
  end
end
