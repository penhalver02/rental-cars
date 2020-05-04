require 'rails_helper'

feature 'Visitor view manufacturers' do
  scenario 'successfully' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_content('Fiat')
    expect(page).to have_content('Volkswagen')
  end

  scenario 'and view details' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).not_to have_content('Volkswagen')
  end

  scenario 'and no manufacturers are created' do
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_content('Nenhum fabricante cadastrado')
  end

  scenario 'and return to home page' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to manufacturers page' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    user = User.create!(email: 'lucas@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Voltar'

    expect(current_path).to eq manufacturers_path
  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Fabricantes')
  end

  scenario 'cannot view unless logged in' do
    visit manufacturers_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'cannot view unless logged in' do
    manufacturer = Manufacturer.create!(name: 'Volkswagen')

    visit manufacturer_path(manufacturer)

    expect(current_path).to eq(new_user_session_path)
  end
end
