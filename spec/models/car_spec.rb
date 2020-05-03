require 'rails_helper'

RSpec.describe Car, type: :model do
  context 'Validation ' do
    it 'license plate cannot be blank' do
      car = Car.new

      car.valid?

      expect(car.errors[:license_plate]).to include('não pode ficar em branco')
    end

    it 'color cannot be blank' do
      car = Car.new
      
      car.valid?

      expect(car.errors[:color]).to include('não pode ficar em branco')
    end

    it 'mileage cannot be blank' do
      car = Car.new

      car.valid?

      expect(car.errors[:mileage]).to  include('não pode ficar em branco')
    end

    it 'car model cannot be blank' do
      car = Car.new

      car.valid?

      expect(car.errors[:car_model_id]).to include('não pode ficar em branco')
    end

    it 'subsidiary cannot be blank' do
      car = Car.new

      car.valid?

      expect(car.errors[:subsidiary_id]).to include('não pode ficar em branco')
    end

    it 'license plate must be unique' do
      volkswagen = Manufacturer.create!(name: 'Volkswagen')
      cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
      gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                            fuel_type: 'Gasolina')
      mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
      Car.create!(license_plate: 'EMS-3633', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)
      car = Car.new(license_plate: 'EMS-3633', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)

      car.valid?

      expect(car.errors[:license_plate]).to include('já está em uso')
    end

    it 'mileagem must be greater than 0' do
      car = Car.new(mileage: -10)

      car.valid?

      expect(car.errors[:mileage]).to include('deve ser maior que 0')
    end
  end
end
