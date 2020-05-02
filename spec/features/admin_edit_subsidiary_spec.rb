require 'rails_helper'

feature 'Admin update subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Filiais'
    click_on 'Motorx'
    click_on 'Editar'

    fill_in 'Nome', with: 'LuxCar'
    fill_in 'CNPJ', with: '56.727.689/0001-05'
    fill_in 'Endereço', with: 'rua verde'
    click_on 'Enviar'

    expect(page).to have_content('Filial: LuxCar')
    expect(page).to have_content('cnpj: 56.727.689/0001-05')
    expect(page).to have_content('Endereço: rua verde')
  end

  scenario 'and must be authenticated' do
    subsidiary = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')

    visit edit_subsidiary_path(subsidiary)

    expect(current_path).to eq(new_user_session_path)
  end
end