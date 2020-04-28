require 'rails_helper'

feature 'Admim register valid subsidiary' do
  scenario 'and name and CNPJ must be unique' do
    Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Motorx'
    fill_in 'CNPJ', with: '56.727.689/0001-05'
    fill_in 'Endereço', with: 'rua verde'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end

  scenario 'and attributes can not be blank' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'cnpj must be valid' do
    
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Motorx'
    fill_in 'CNPJ', with: '56727689000105'
    fill_in 'Endereço', with: 'rua verde'
    click_on 'Enviar'

    expect(page).to have_content('Cnpj não é válido')
    
  end

end