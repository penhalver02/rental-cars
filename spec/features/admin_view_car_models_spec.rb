require 'rails_helper'

feature 'Admin view car models' do
  scenario 'successfully' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, fuel_type: 'Gasolina')
    CarModel.create!(name: 'Uno', year: 2020,manufacturer: fiat, motorization: '1.4', car_category: cat_a, fuel_type: 'Gasolina' )

    visit root_path
    click_on 'Modelos de carros'

    expect(page).to have_content('Volkswagen')
    expect(page).to have_content('Gol')
    expect(page).to have_content('2018')

    expect(page).to have_content('Fiat')
    expect(page).to have_content('Uno')
    expect(page).to have_content('2020')
  end

  scenario 'and view details' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, fuel_type: 'Gasolina')

    visit root_path
    click_on 'Modelos de carros'
    click_on 'Gol'

    expect(page).to have_content('Nome: Gol')
    expect(page).to have_content('Ano: 2018')
    expect(page).to have_content('Fabricante: Volkswagen')
    expect(page).to have_content('Motor: 1.0')
    expect(page).to have_content('Tipo de combustível: Gasolina')
    expect(page).to have_content('Categoria: A')
    expect(page).to have_content('Preço: R$ 100,00')
    expect(page).to have_content('Preço do seguro: R$ 100,00')
    expect(page).to have_content('Preço do seguro para terceiros: R$ 50,00')

  end

  scenario 'and no car model are created' do
    visit root_path
    click_on 'Modelos de carros'

    expect(page).to have_content('Nenhum modelo cadastrado')
  end

  scenario 'and return to home page' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                      fuel_type: 'Gasolina')
    CarModel.create!(name: 'Uno', year: 2020,manufacturer: fiat, motorization: '1.4', car_category: cat_a, 
                      fuel_type: 'Gasolina' )

    visit root_path
    click_on 'Modelos de carros'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to car models page' do
    volkswagen = Manufacturer.create!(name: 'Volkswagen')
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarModel.create!(name: 'Gol', year: 2018,manufacturer: volkswagen, motorization: '1.0', car_category: cat_a, 
                      fuel_type: 'Gasolina')
    CarModel.create!(name: 'Uno', year: 2020,manufacturer: fiat, motorization: '1.4', car_category: cat_a, 
                      fuel_type: 'Gasolina' )

    visit root_path
    click_on 'Modelos de carros'
    click_on 'Gol'
    click_on 'Voltar'

    expect(current_path).to eq car_models_path
  end
end