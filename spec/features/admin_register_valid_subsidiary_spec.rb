require 'rails_helper'

feature 'Admim register valid subsidiary' do
  scenario 'and name and CNPJ must be unique' do
    Subsidiary.create!(name: 'Motorx',cnpj: '12345', address: 'rua verde')
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Motorx'
    fill_in 'CNPJ', with: '12345'
    fill_in 'Endereço', with: 'rua verde'
    click_on 'Enviar'

    expect(page).to have_content('Nome deve ser único')
    expect(page).to have_content('Cnpj deve ser único')
  end

  scenario 'and attributes can not be blank' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Todos atributos não podem ficar em branco')
  end

end