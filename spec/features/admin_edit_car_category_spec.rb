require 'rails_helper'

feature 'Admin edit car category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Categoria A'
    click_on 'Editar'

    fill_in 'Categoria', with: 'A'
    fill_in 'Preço da diaria', with: 60
    fill_in 'Preço do seguro', with: 100
    fill_in 'Preço do seguro para terceiro', with: 50
    click_on 'Enviar'

    
    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Preço da diaria: R$ 60,00')
    expect(page).to have_content('Preço do seguro: R$ 100,00')
    expect(page).to have_content('Preço do seguro para terceiro: R$ 50,00')
    expect(page).to have_link('Voltar')
  end

  scenario 'and must be authenticated' do
    car_category = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)

    visit edit_car_category_path(car_category)

    expect(current_path).to eq(new_user_session_path)
  end
end