require 'rails_helper'

  feature 'Visitor view subsidiary' do
    scenario 'successfully' do
      Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
      Subsidiary.create!(name: 'Ccar',cnpj: '77.145.867/0001-60', address: 'rua azul')

      visit root_path
      click_on 'Filiais'

      expect(page).to have_content('Motorx')
      expect(page).to have_content('Ccar')
      
    end

    scenario 'and view details' do
      Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')

      visit root_path
      click_on 'Filiais'
      click_on 'Motorx'

      expect(page).to have_content('Filial: Motorx')
      expect(page).to have_content('cnpj: 56.727.689/0001-05')
      expect(page).to have_content('Endereço: rua verde')
    
    end
    
    scenario 'and no subsidiary are created' do
      visit root_path
      click_on 'Filiais'

      expect(page).to have_content('Nenhuma filial cadastrada')
    end

    scenario 'and return to home page' do
      Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
      Subsidiary.create!(name: 'Ccar',cnpj: '77.145.867/0001-60', address: 'rua azul')

      visit root_path
      click_on 'Filiais'
      click_on 'Voltar'

      expect(current_path).to eq root_path
    end

    scenario 'and return to subsidiary page' do
      Subsidiary.create!(name: 'Motorx',cnpj: '56.727.689/0001-05', address: 'rua verde')
      Subsidiary.create!(name: 'Ccar',cnpj: '77.145.867/0001-60', address: 'rua azul')

      visit root_path
      click_on 'Filiais'
      click_on 'Motorx'
      click_on 'Voltar'

      expect(current_path).to eq subsidiaries_path
    end
  end