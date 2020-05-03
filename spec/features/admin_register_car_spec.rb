require 'rails_helper'

feature 'Admin register car' do
  scenario 'successfully' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
    click_on 'Registrar novo carro'

    fill_in 'Placa', with: 'EMS-3336'
    fill_in 'Cor', with: 'Preto'
    fill_in 'Quilometragem', with: '10000'
    select gol.name, from: 'Modelo de carro'
    select mortorx.name, from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content('Nome: Gol')
    expect(page).to have_content('Cor: Preto')
    expect(page).to have_content('Quilometragem: 10000')
    expect(page).to have_content('Volkswagen')
    expect(page).to have_content('Categoria A')
  end

  scenario 'and fill in all fields' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')
    login_as user, scope: :user
    visit new_car_path

    click_on 'Enviar'
  
    expect(page).to have_content('Placa não pode ficar em branco')
    expect(page).to have_content('Cor não pode ficar em branco')
    expect(page).to have_content('Quilometragem não pode ficar em branco')
    expect(page).to have_content('Modelo de carro é obrigatório(a)')
    expect(page).to have_content('Filial é obrigatório(a)')
  end

  scenario 'and fill in all fields' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    Car.create!(license_plate: 'EMS-3336', color: 'Preto', car_model: gol, mileage: '10000', subsidiary: mortorx)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')
    
    login_as user, scope: :user
    visit new_car_path

    fill_in 'Placa', with: 'EMS-3336'
    fill_in 'Cor', with: 'Preto'
    fill_in 'Quilometragem', with: '10000'
    select gol.name, from: 'Modelo de carro'
    select mortorx.name, from: 'Filial'
    click_on 'Enviar'
  
    expect(page).to have_content('Placa já está em uso')
  end

  scenario 'successfully' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    gol = CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                          fuel_type: 'Gasolina')
    mortorx = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Carros'
    click_on 'Registrar novo carro'

    fill_in 'Placa', with: 'EMS-3336'
    fill_in 'Cor', with: 'Preto'
    fill_in 'Quilometragem', with: '-10'
    select gol.name, from: 'Modelo de carro'
    select mortorx.name, from: 'Filial'
    click_on 'Enviar'

    expect(page).to have_content('Quilometragem deve ser maior que 0')

  end

  scenario 'and must be authenticated' do
    visit new_car_path

    expect(current_path).to eq(new_user_session_path)
  end
end