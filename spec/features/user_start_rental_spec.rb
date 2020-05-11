require 'rails_helper'

feature 'User start rental' do
  scenario 'successfully' do
    manufacturer = Manufacturer.create!(name: 'Volkswagen')
    car_category = CarCategory.create!(name: 'A', daily_rate: 100,car_insurance: 100, third_part_insurance: 50)
    car_model = CarModel.create!(name: 'Gol', year: 2018, manufacturer: manufacturer, motorization: '1.0', 
                                car_category: car_category, fuel_type: 'Gasolina')
    customer = Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
    rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer,
                            car_category: car_category)
    subsidiary = Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
    car = Car.create!(license_plate: 'ABC-1000', color: 'Preto', car_model: car_model, mileage: '10000',
                subsidiary: subsidiary)
    user = User.create!(email: 'test@gmail.com', password: '12345678')

    login_as user, scope: :user
    visit rental_path(rental)
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    click_on 'Confirmar locacao'

    expect(page).to have_content(I18n.l(Time.zone.now, format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end
end