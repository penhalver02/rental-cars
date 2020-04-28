require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validation' do

    context '#email' do
      it 'email must be format' do
        customer = Customer.new(name: 'Lucas', cpf: '382.162.338-17', email: 'lu,cas@gmail.com')

        customer.valid?
        
        expect(customer.errors[:email]).to include('não é válido')

      end
      
      it 'email must be unique' do
        Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
        customer = Customer.new(name: 'Lucas', cpf: '482.162.338-17', email: 'lucas@gmail.com')

        customer.valid?

        expect(customer.errors[:email]).to include('já está em uso')
        
      end

      it 'email cannot be blank' do
        customer = Customer.new

        customer.valid?

        expect(customer.errors[:email]).to include('não pode ficar em branco')
      end
    end

    context '#cpf' do
      it 'cpf must be format' do
        customer = Customer.new(cpf: '182.162.138-17')

        customer.valid?
        
        expect(customer.errors[:cpf]).to include('não é válido')
      end

      it 'cpf must be unique' do
        Customer.create!(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')
        customer = Customer.new(name: 'Lucas', cpf: '382.162.338-17', email: 'lucas@gmail.com')

        customer.valid?

        expect(customer.errors[:cpf]).to include('já está em uso')
      end

      it 'cpf cannot be blank' do
        customer = Customer.new

        customer.valid?

        expect(customer.errors[:cpf]).to include('não pode ficar em branco')
      end
    end

    context '#name' do
      it 'name cannot be blank' do
        customer = Customer.new

        customer.valid?

        expect(customer.errors[:cpf]).to include('não pode ficar em branco')
      end
    end
  end
end
