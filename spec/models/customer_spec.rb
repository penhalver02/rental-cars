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

  it 'by exact name' do
    customer = Customer.create!(name: 'Lucas Penhalver', email: 'lucas@gmail.com', cpf: '198.296.657-20')
    another_customer = Customer.create!(name: 'Caio', email: 'caio@gmail.com', cpf: '374.922.268-10')

    result = Customer.search('Lucas Penhalver')

    expect(result).to include(customer)
    expect(result).not_to include(another_customer)
  end

  it 'by partial name' do
    customer = Customer.create!(name: 'Lucas Penhalver', email: 'lucas@gmail.com', cpf: '198.296.657-20')
    another_customer = Customer.create!(name: 'Caio', email: 'caio@gmail.com', cpf: '374.922.268-10')

    result = Customer.search('Lucas')

    expect(result).to include(customer)
    expect(result).not_to include(another_customer)
  end

  it 'finds nothing' do
    customer = Customer.create!(name: 'Lucas Penhalver', email: 'lucas@gmail.com', cpf: '198.296.657-20')
    another_customer = Customer.create!(name: 'Caio', email: 'caio@gmail.com', cpf: '374.922.268-10')

    result = Customer.search('test')

    expect(result).to be_blank
  end

  it 'by cpf' do
    customer = Customer.create!(name: 'Lucas Penhalver', email: 'lucas@gmail.com', cpf: '198.296.657-20')
    another_customer = Customer.create!(name: 'Caio', email: 'caio@gmail.com', cpf: '374.922.268-10')

    result = Customer.search('198.296.657-20')

    expect(result).to include(customer)
    expect(result).not_to include(another_customer)
  end
end
