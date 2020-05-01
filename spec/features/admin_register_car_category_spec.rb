require 'rails_helper'

feature 'Admin register car category' do
  scenario 'from index page' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_link('Registrar nova categoria', href: new_car_category_path)
  end

  scenario 'successfully' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'

    fill_in 'Categoria', with: 'A'
    fill_in 'Preço da diaria', with: 100
    fill_in 'Preço do seguro', with: 100
    fill_in 'Preço do seguro para terceiro', with: 50
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Preço da diaria: R$ 100,00')
    expect(page).to have_content('Preço do seguro: R$ 100,00')
    expect(page).to have_content('Preço do seguro para terceiro: R$ 50,00')
    expect(page).to have_link('Voltar')
  end 
end