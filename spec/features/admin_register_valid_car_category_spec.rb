require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and attribute can not be blank' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'


    
    fill_in 'Categoria', with: ''
    fill_in 'Preço da diaria', with: ''
    fill_in 'Preço do seguro', with: ''
    fill_in 'Preço do seguro para terceiro', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Categoria não pode ficar em branco')
    expect(page).to have_content('Preço da diaria não pode ficar em branco')
    expect(page).to have_content('Preço do seguro não pode ficar em branco')
    expect(page).to have_content('Preço do seguro para terceiro não pode ficar em branco')
  end

  scenario 'daily rate must be valid' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'

    fill_in 'Categoria', with: 'A'
    fill_in 'Preço da diaria', with: '0'
    fill_in 'Preço do seguro', with: '100'
    fill_in 'Preço do seguro para terceiro', with: '50'
    click_on 'Enviar'

    expect(page).to have_content('Preço da diaria deve ser maior que 0')
  end

  scenario 'and must be authenticated' do
    visit new_car_category_path

    expect(current_path).to eq(new_user_session_path)
  end
end