require 'rails_helper'

feature 'Admin view car ' do
  scenario 'successfully' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    Car.create!(license_plate: 'EMS-3633', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)
    Car.create!(license_plate: 'ABC-1000', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Carros'

    expect(page).to have_content('Gol')
    expect(page).to have_content('EMS-3633')

    expect(page).to have_content('Gol')
    expect(page).to have_content('ABC-1000')
  end

  scenario 'and view details' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    Car.create!(license_plate: 'EMS-3633', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit cars_path
    click_on 'Gol'

    expect(page).to have_content('Nome: Gol')
    expect(page).to have_content('Cor: Preto')
    expect(page).to have_content('Quilometragem: 10000')
    expect(page).to have_content('Volkswagen')
    expect(page).to have_content('Categoria A')
  end

  scenario 'and no cars are created' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit cars_path

    expect(page).to have_content('Nenhum carro cadastrado')
  end

  scenario 'and return to home page' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    Car.create!(license_plate: 'EMS-3633', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end

  scenario 'and return to home page' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    Car.create!(license_plate: 'EMS-3633', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
    click_on 'Gol'
    click_on 'Voltar'

    expect(current_path).to eq(cars_path)
  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Carros')
  end

  scenario 'cannot view unless logged in'do
    visit cars_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'cannot view unless logged in' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    Car.create!(license_plate: 'EMS-3633', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)

    visit car_path(Car.last.id)

    expect(current_path).to eq(new_user_session_path)
  end
end