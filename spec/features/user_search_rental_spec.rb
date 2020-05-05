require 'rails_helper'

feature 'User search rental' do
  scenario 'successfully' do
    lucas = Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 50)
    rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: lucas, car_category: cat_a)
    another_rental = Rental.create!(start_date: 1.day.from_now,end_date: 2.day.from_now, customer: lucas, car_category: cat_a)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'

    fill_in 'Codigo', with: rental.code
    click_on 'Buscar'

    expect(page).to have_content(rental.code)
    expect(page).not_to have_content(another_rental.code)
  end

  scenario 'cannot be blank' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'

    fill_in 'Codigo', with: ''
    click_on 'Buscar'

    expect(page).to have_content('Nenhum resultado encontrado para:')
  end

  scenario 'and code  cannot be found' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'

    fill_in 'Codigo', with: 'ABC123'
    click_on 'Buscar'

    expect(page).to have_content('Nenhum resultado encontrado para: ABC123')
   
  end
end