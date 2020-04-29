require 'rails_helper'

feature 'User register valid customer' do
  scenario 'and cpf and email must be unique' do
    Customer.create!(name: 'Lucas',cpf: '382.162.338-17',email: 'lucas@gmail.com')
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'

    fill_in 'Nome', with: 'Lucas'
    fill_in 'CPF', with: '382.162.338-17'
    fill_in 'Email', with: 'lucas@gmail.com'
    click_on 'Enviar'

    expect(page).to have_content('CPF já está em uso')
  end

  scenario 'and attribute can not be blank' do
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'


    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Email', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
  end

  scenario 'cpf invalid' do
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'

    fill_in 'Nome', with: 'Lucas'
    fill_in 'CPF', with: '181.122.338-17'
    fill_in 'Email', with: 'lucas@gmail.com'
    click_on 'Enviar'
    
    expect(page).to have_content('CPF não é válido')
  end
end