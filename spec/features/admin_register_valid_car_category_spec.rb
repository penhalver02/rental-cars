require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and name must be unique' do
    CarCategory.create(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'

   
    fill_in 'Modelo', with: 'A'
    fill_in 'Preço da diaria', with: 100
    fill_in 'Preço do seguro', with: 100
    fill_in 'Preço do seguro para terceiro', with: 50
    click_on 'Enviar'

   expect(page).to have_content('Nome deve ser único')
  end

  scenario 'and attribute can not be blank' do
    visit root_path
    click_on 'Categorias de carro'
    click_on 'Registrar nova categoria'


    
    fill_in 'Modelo', with: ''
    fill_in 'Preço da diaria', with: ''
    fill_in 'Preço do seguro', with: ''
    fill_in 'Preço do seguro para terceiro', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Todos atributos não podem ficar em branco')
  end
end