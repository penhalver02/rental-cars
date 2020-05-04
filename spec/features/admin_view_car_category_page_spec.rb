require 'rails_helper'

feature 'Admin view car category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarCategory.create!(name: 'B', daily_rate: 50, car_insurance: 90, third_part_insurance: 40)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Preço da diaria: R$ 100,00')
    expect(page).to have_content('Categoria B')
    expect(page).to have_content('Preço da diaria: R$ 50,00')
  end 

  scenario 'and view details' do
    car_category = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    manufacturer = Manufacturer.create!(name: 'Fiat')
    uno = CarModel.create!(name: 'Uno', year: 2020, manufacturer: manufacturer, motorization: '1.0', fuel_type: 'Flex', 
                          car_category: car_category)
    mobi = CarModel.create!(name: 'Mobi', year: 2020, manufacturer: manufacturer, motorization: '1.0', fuel_type: 'Flex', 
                            car_category: car_category)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')
    
    login_as user, scope: :user 
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Categoria A'

    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Preço da diaria: R$ 100,00')
    expect(page).to have_content('Preço do seguro: R$ 100,00')
    expect(page).to have_content('Preço do seguro para terceiro: R$ 50,00')
    expect(page).to have_link('Uno', href: car_model_path(uno))
    expect(page).to have_link('Mobi', href: car_model_path(mobi))

  end

  scenario 'and view filtered car models' do
    car_category_a = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    car_category_b = CarCategory.create!(name: 'B', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    manufacturer = Manufacturer.create!(name: 'Fiat')
    uno = CarModel.create!(name: 'Uno', year: 2020, manufacturer: manufacturer, motorization: '1.0', fuel_type: 'Flex', 
                          car_category: car_category_a)
    toro = CarModel.create!(name: 'Toro', year: 2020, manufacturer: manufacturer, motorization: '1.0', fuel_type: 'Flex', 
        car_category: car_category_b)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Categoria A'

    expect(page).to have_link('Uno', href: car_model_path(uno))
    expect(page).not_to have_link('Toto')
  end

  scenario 'and no car category are created' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Nenhuma categoria cadastrada')

  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarCategory.create!(name: 'B', daily_rate: 50, car_insurance: 90, third_part_insurance: 40)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to car category' do
    CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarCategory.create!(name: 'B', daily_rate: 50, car_insurance: 90, third_part_insurance: 40)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Categoria A'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Categorias de carro')
  end

  scenario 'cannot view unless logged in' do
    visit car_categories_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'cannot view unless logged in' do
    car_category = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)

    visit car_category_path(car_category)

    expect(current_path).to eq(new_user_session_path)
  end
end