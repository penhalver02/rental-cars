require 'rails_helper'

feature 'Admin view rental' do
  scenario 'successfully' do
    lucas = Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 50)
    Rental.create!(start_date: '20/03/2030',end_date: '30/03/2030', customer: lucas, car_category: cat_a)
    Rental.create!(start_date: '01/03/2030',end_date: '10/03/2030', customer: lucas, car_category: cat_a)

    visit root_path
    click_on 'Locações'

    expect(page).to have_content('Lucas')
    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Data 20/03/2030 a 30/03/2030')

    expect(page).to have_content('Lucas')
    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Data 01/03/2030 a 10/03/2030')
  end

  scenario 'and view details' do
    lucas = Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 50)
    Rental.create!(start_date: '20/03/2030',end_date: '30/03/2030', customer: lucas, car_category: cat_a)

    visit root_path
    click_on 'Locações'
    click_on 'detalhes'

    expect(page).to have_content('Data de inicio: 20/03/2030')
    expect(page).to have_content('Data de termino: 30/03/2030')
    expect(page).to have_content('Cliente: Lucas')
    expect(page).to have_content('Categoria: A')
  end

  scenario ' and no rental are created' do
    visit root_path
    click_on 'Locações'

    expect(page).to have_content('Nenhuma locacao cadastrada')
  end

  scenario 'and return to home page' do
    lucas = Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 50)
    Rental.create!(start_date: '20/03/2030',end_date: '30/03/2030', customer: lucas, car_category: cat_a)

    visit root_path
    click_on 'Locações'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to rentals page' do
    lucas = Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 50)
    Rental.create!(start_date: '20/03/2030',end_date: '30/03/2030', customer: lucas, car_category: cat_a)

    visit root_path
    click_on 'Locações'
    click_on 'detalhes'
    click_on 'Voltar'

    expect(current_path).to eq rentals_path
  end
end