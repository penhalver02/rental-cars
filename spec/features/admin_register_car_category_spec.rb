require 'rails_helper'

feature 'Admin register car category' do
  scenario 'from index page' do
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_link('Registrar nova categoria', href: new_car_category_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'Modelo A'
    fill_in 'Diaria', with: 100
    fill_in 'Seguro', with: 300
    fill_in 'Terceira parte do seguro', with: 100
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('Modelo A')
    expect(page).to have_content(100)
    expect(page).to have_content(300)
    expect(page).to have_content(100)
    expect(page).to have_link('Voltar')
  end 
end