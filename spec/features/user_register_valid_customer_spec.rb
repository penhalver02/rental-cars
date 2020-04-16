require 'rails_helper'

feature 'User register valid customer' do
  scenario 'and cpf and email must be unique' do
    Customer.create!(name: 'Lucas',cpf: '123.45',email: 'lucas@gmail.com')
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'

    fill_in 'Nome', with: 'Lucas'
    fill_in 'CPF', with: '123.45'
    fill_in 'Email', with: 'lucas@gmail.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF deve ser único')
    expect(page).to have_content('Email deve ser único')
  end

  scenario 'and attribute can not be blank' do
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'


    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Email', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Todos atributos não podem ficar em branco')
  end
end