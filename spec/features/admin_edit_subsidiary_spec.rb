require 'rails_helper'

feature 'Admin update subsidiary' do
  scenario 'successfuly' do
    Subsidiary.create!(name: 'Fiat Rio',cnpj: '12345', address: 'rua verde')

    visit root_path
    click_on 'Filiais'
    click_on 'Fiat Rio'
    click_on 'Editar'

    fill_in 'Nome', with: 'Fiat Salvador'
    fill_in 'CNPJ', with: '12345'
    fill_in 'Endereço', with: 'rua verde'
    click_on 'Enviar'

    expect(page).to have_content('Fiat Salvador')
    expect(page).to have_content('12345')
    expect(page).to have_content('rua verde')
  end
end