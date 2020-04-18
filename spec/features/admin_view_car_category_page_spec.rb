require 'rails_helper'

feature 'Admin view subsidiary' do
  scenario 'successfully' do
    CarCategory.create(name: 'Modelo A', daily_rate: 100,car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Modelo B', daily_rate: 200, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Modelo A')
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Modelo B')
    expect(page).to have_content('R$ 200,00')
  end 

  scenario 'and view details' do
    CarCategory.create(name: 'Modelo A', daily_rate: 100,car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Modelo B', daily_rate: 200, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Modelo A'

    expect(page).to have_content('Modelo A')
    expect(page).to have_content(100)
    expect(page).to have_content(300)
    expect(page).to have_content(100)
    expect(page).not_to have_content('Modelo B')
    expect(page).not_to have_content(200)
    expect(page).not_to have_content(600)
    expect(page).not_to have_content(200)

  end

  scenario 'and no car category are created' do
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Nenhuma categoria cadastrada')

  end

  scenario 'and return to home page' do
    CarCategory.create(name: 'Modelo A', daily_rate: 100,car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Modelo B', daily_rate: 200, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to car category' do
    CarCategory.create(name: 'Modelo A', daily_rate: 100,car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Modelo B', daily_rate: 200, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Modelo A'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end