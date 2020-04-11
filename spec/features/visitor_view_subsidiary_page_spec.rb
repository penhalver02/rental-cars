require 'rails_helper'

  feature 'Visitor view subsidiary' do
    scenario 'successfully' do
      Subsidiary.create!(name: 'Fiat Rio',cnpj: '12345', address: 'rua verde')
      Subsidiary.create!(name: 'Volkswagen salvador',cnpj: '5678', address: 'rua azul')

      visit root_path
      click_on 'Filiais'

      expect(page).to have_content('Fiat Rio')
      expect(page).to have_content('Volkswagen salvador')
      
    end

    scenario 'and view details' do
      Subsidiary.create!(name: 'Fiat Rio',cnpj: '12345', address: 'rua verde')
      Subsidiary.create!(name: 'Volkswagen salvador',cnpj: '5678', address: 'rua azul')

      visit root_path
      click_on 'Filiais'
      click_on 'Fiat Rio'

      expect(page).to have_content('Fiat Rio')
      expect(page).to have_content('12345')
      expect(page).to have_content('rua verde')
      expect(page).not_to have_content('Volkswagen salvador')
      expect(page).not_to have_content('5678')
      expect(page).not_to have_content('rua azul')
    end

    scenario 'and no subsidiary are created' do
      visit root_path
      click_on 'Filiais'

      expect(page).to have_content('Nenhuma filial cadastrada')
    end

    scenario 'and return to home page' do
      Subsidiary.create!(name: 'Fiat Rio',cnpj: '12345', address: 'rua verde')
      Subsidiary.create!(name: 'Volkswagen salvador',cnpj: '5678', address: 'rua azul')

      visit root_path
      click_on 'Filiais'
      click_on 'Voltar'

      expect(current_path).to eq root_path
    end

    scenario 'and return to subsidiary page' do
      Subsidiary.create!(name: 'Fiat Rio',cnpj: '12345', address: 'rua verde')
      Subsidiary.create!(name: 'Volkswagen salvador',cnpj: '5678', address: 'rua azul')

      visit root_path
      click_on 'Filiais'
      click_on 'Fiat Rio'
      click_on 'Voltar'

      expect(current_path).to eq subsidiaries_path
    end
  end