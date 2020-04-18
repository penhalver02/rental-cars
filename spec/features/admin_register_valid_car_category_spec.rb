require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and name must be unique' do
    CarCategory.create(name: 'Modelo A', daily_rate: 100,car_insurance: 300, third_party_insurance: 100)
    
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'Modelo A'
    fill_in 'Diaria', with: 100
    fill_in 'Seguro', with: 300
    fill_in 'Terceira parte do seguro', with: 100
    click_on 'Enviar'

   expect(page).to have_content('Nome deve ser único')
  end

  scenario 'and attribute can not be blank' do
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'


    fill_in 'Nome', with: ''
    fill_in 'Diaria', with: ''
    fill_in 'Seguro', with: ''
    fill_in 'Terceira parte do seguro', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Todos atributos não podem ficar em branco')
  end
end