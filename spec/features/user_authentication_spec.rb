require 'rails_helper'

feature 'User authentication' do
  context 'log in' do
    scenario 'successfully' do
      user = User.create!(email: 'lucas@gmail.com', password: '12345678')

      visit root_path
      click_on 'Entrar'
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'
      end
      
      
      expect(page).to have_content('Login efetuado com sucesso')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Sair')
      expect(current_path).to eq(root_path)
    end

    xscenario 'and must fill in all fields' do
      visit root_path
      click_on 'Entrar'
      

      expect(page).to have_content('Email nao pode ficar em branco')
      expect(page).to have_content('Senha nao pode ficar em branco')
    end
  end

  context 'log out' do
    scenario 'successfully' do
      user = User.create!(email: 'lucas@gmail.com', password: '12345678')

      visit root_path
      click_on 'Entrar'
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'
      end
      click_on 'Sair'
      
      
      expect(page).to have_content('Saiu com sucesso')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
      expect(current_path).to eq(root_path)
    end
  end
end