require 'rails_helper'

feature 'User register customer' do
  scenario 'from index page' do
    visit root_path
    click_on 'Clientes'

    expect(page).to have_link('Registrar novo cliente', href: new_customer_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'

    fill_in 'Nome', with: 'Lucas'
    fill_in 'CPF', with: '123.45'
    fill_in 'Email', with: 'lucas@gmail.com'
    click_on 'Enviar'

    expect(current_path).to eq customer_path(Customer.last.id)
    expect(page).to have_content('Lucas')
    expect(page).to have_content('123.45')
    expect(page).to have_content('lucas@gmail.com')
    expect(page).to have_link('Voltar')
  end
end