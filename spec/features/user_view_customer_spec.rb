require 'rails_helper'

feature 'User view customer' do
  scenario 'successfully' do
    Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    Customer.create!(name: 'Caio', cpf: '283.747.060-07', email: 'caio@gmail.com')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content('Lucas')
  end

  scenario 'and view details' do
    Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Lucas'

    expect(page).to have_content('Lucas')
    expect(page).to have_content('382.162.338-17')
    expect(page).to have_content('lucas@gmail.com')
  end

  scenario 'and no customers are created' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content('Nenhum cliente cadastrado')
  end

  scenario 'and return to home page' do
    Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end

  scenario 'and return to customers page' do
    Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Lucas'
    click_on 'Voltar'

    expect(current_path).to eq(customers_path)
  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(current_path).not_to have_link('Cliente')
  end

  scenario 'cannot view unless logged in' do
    visit customers_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'cannot view unless logged in' do
    customer = Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    
    visit customer_path(customer)

    expect(current_path).to eq(new_user_session_path)
  end
end