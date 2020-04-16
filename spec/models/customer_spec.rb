require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validation' do
    it 'cpf and email must be uniq' do
      Customer.create!(name: 'Lucas', cpf: '123.45', email: 'lucas@gmail.com')
      customer = Customer.new(name: 'Lucas', cpf: '123.45', email: 'lucas@gmail.com')

      customer.valid?

      expect(customer.errors[:cpf]).to include('CPF deve ser único')
      expect(customer.errors[:email]).to include('Email deve ser único')
    end

    it 'attribute can not e blank' do
      customer = Customer.new

      customer.valid?

      expect(customer.errors[:name]).to include('Todos atributos não podem ficar em branco')
      expect(customer.errors[:cpf]).to include('Todos atributos não podem ficar em branco')
      expect(customer.errors[:email]).to include('Todos atributos não podem ficar em branco')

    end
  end
end
