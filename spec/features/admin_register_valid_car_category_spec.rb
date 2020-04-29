require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and attribute can not be blank' do
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
end