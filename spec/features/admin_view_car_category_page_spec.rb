require 'rails_helper'

feature 'Admin view subsidiary' do
  scenario 'successfully' do
    CarCategory.create(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarCategory.create(name: 'B', daily_rate: 50, car_insurance: 90, third_part_insurance: 40)

    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Modelo A')
    expect(page).to have_content('Preço da diaria: R$ 100,00')
    expect(page).to have_content('Modelo B')
    expect(page).to have_content('Preço da diaria: R$ 50,00')
  end 

  scenario 'and view details' do
    CarCategory.create(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Modelo A'

    expect(page).to have_content('Modelo A')
    expect(page).to have_content('Preço da diaria: R$ 100,00')
    expect(page).to have_content('Preço do seguro: R$ 100,00')
    expect(page).to have_content('Preço do seguro para terceiro: R$ 50,00')

  end

  scenario 'and no car category are created' do
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Nenhuma categoria cadastrada')

  end

  scenario 'and return to home page' do
    CarCategory.create(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarCategory.create(name: 'B', daily_rate: 50, car_insurance: 90, third_part_insurance: 40)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to car category' do
    CarCategory.create(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    CarCategory.create(name: 'B', daily_rate: 50, car_insurance: 90, third_part_insurance: 40)

    visit root_path
    click_on 'Categorias de carro'
    click_on 'Modelo A'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end