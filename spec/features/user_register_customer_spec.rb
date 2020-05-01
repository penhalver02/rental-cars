require 'rails_helper'

feature 'User register customer' do
  scenario 'from index page' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'

    expect(page).to have_link('Registrar novo cliente', href: new_customer_path)
  end

  scenario 'successfully' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo cliente'

    fill_in 'Nome', with: 'Lucas'
    fill_in 'CPF', with: '382.162.338-17'
    fill_in 'Email', with: 'lucas@gmail.com'
    click_on 'Enviar'

    expect(current_path).to eq customer_path(Customer.last.id)
    expect(page).to have_content('Lucas')
    expect(page).to have_content('382.162.338-17')
    expect(page).to have_content('lucas@gmail.com')
    expect(page).to have_link('Voltar')
  end
  
  scenario 'and must be authenticated' do
    visit new_customer_path

    expect(current_path).to eq(new_user_session_path)
  end
end