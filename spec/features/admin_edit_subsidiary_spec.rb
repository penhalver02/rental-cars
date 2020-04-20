require 'rails_helper'

feature 'Admin update subsidiary' do
  scenario 'successfuly' do
    Subsidiary.create!(name: 'Motorx',cnpj: '12345', address: 'rua verde')

    visit root_path
    click_on 'Filiais'
    click_on 'Motorx'
    click_on 'Editar'

    fill_in 'Nome', with: 'LuxCar'
    fill_in 'CNPJ', with: '12345'
    fill_in 'Endereço', with: 'rua verde'
    click_on 'Enviar'

    expect(page).to have_content('Filial: LuxCar')
    expect(page).to have_content('cnpj: 12345')
    expect(page).to have_content('Endereço: rua verde')
  end
end