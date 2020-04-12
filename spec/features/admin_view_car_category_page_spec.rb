require 'rails_helper'

feature 'Admin view subsidiary' do
  scenario 'successfully' do
    CarCategory.create(name: 'Hatch', daily_rate: 5.1,car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Picape', daily_rate: 10.2, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Hatch')
    expect(page).to have_content('Picape')
  end 

  scenario 'and view details' do
    CarCategory.create(name: 'Hatch', daily_rate: 5.1, car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Picape', daily_rate: 10.2, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Hatch'

    expect(page).to have_content('Hatch')
    expect(page).to have_content(5.1)
    expect(page).to have_content(300)
    expect(page).to have_content(100)
    expect(page).not_to have_content('Picape')
    expect(page).not_to have_content(10.2)
    expect(page).not_to have_content(600)
    expect(page).not_to have_content(200)

  end

  scenario 'and no car category are created' do
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Nenhuma categoria cadastrada')

  end

  scenario 'and return to home page' do
    CarCategory.create(name: 'Hatch', daily_rate: 5.1, car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Picape', daily_rate: 10.2, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to car category' do
    CarCategory.create(name: 'Hatch', daily_rate: 5.1, car_insurance: 300, third_party_insurance: 100)
    CarCategory.create(name: 'Picape', daily_rate: 10.2, car_insurance: 600, third_party_insurance: 200)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Hatch'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end