require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Motorx'
    fill_in 'CNPJ', with: '56.727.689/0001-05'
    fill_in 'Endereço', with: 'rua verde'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Filial: Motorx')
    expect(page).to have_content('cnpj: 56.727.689/0001-05')
    expect(page).to have_content('Endereço: rua verde')
    expect(page).to have_link('Voltar')
  end

end