require 'rails_helper'

feature 'Admin register rental' do
  scenario ' successfully' do
    customer = Customer.create!(name: 'Lucas',cpf: '167.876.920-72', email: 'lucas@gmail.com')
    car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 50)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    click_on 'Registrar novas locações'

    fill_in 'Data de inicio', with: '27/04/2030'
    fill_in 'Data de termino', with: '05/05/2030'
    select customer.name, from: 'Cliente'
    select car_category.name, from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content('Data de inicio: 27/04/2030')
    expect(page).to have_content('Data de termino: 05/05/2030')
    expect(page).to have_content("Cliente: #{customer.name}")
    expect(page).to have_content("Categoria: #{car_category.name}")

  end

  scenario 'and fill in all fields' do
    visit new_rental_path

    click_on 'Enviar'
  
    expect(page).to have_content('Data de inicio não pode ficar em branco')
    expect(page).to have_content('Data de termino não pode ficar em branco')
    expect(page).to have_content('Cliente é obrigatório(a)')
    expect(page).to have_content('Categoria de carro é obrigatório(a)')
  end
end