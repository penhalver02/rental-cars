require 'rails_helper'

feature 'User search customer' do
  scenario 'by exact name' do
    user = User.create!(email: 'teste@teste.com', password: '123456789')
    customer = Customer.create!(name: 'Lucas', email: 'lucas@gmail.com', cpf: '198.296.657-20')
    another_customer = Customer.create!(name: 'Caio', email: 'caio@gmail.com', cpf: '374.922.268-10')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: customer.name
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
  end
end