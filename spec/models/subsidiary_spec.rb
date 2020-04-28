require 'rails_helper'

RSpec.describe Subsidiary, type: :model do
  context 'validation' do
    context '#name' do
      it 'name cannot be blank' do
        subsidiary = Subsidiary.new

        subsidiary.valid?

        expect(subsidiary.errors[:name]).to include('não pode ficar em branco')
      
      end
    
      it 'name must be unique' do
        Subsidiary.create!(name: 'Fiat Rio',cnpj: '56.727.689/0001-05', address: 'rua verde')
        subsidiary = Subsidiary.new(name: 'Fiat Rio',cnpj: '77.145.867/0001-60', address: 'rua azul')
        
        subsidiary.valid?

        expect(subsidiary.errors[:name]).to include('já está em uso')
      end
    end
    context '#cnpj' do
      it 'cnpj cannot be blank' do
        subsidiary = Subsidiary.new

        subsidiary.valid?

        expect(subsidiary.errors[:cnpj]).to include('não pode ficar em branco')
      end

      it 'cnpj must be valid format' do
        subsidiary = Subsidiary.new(cnpj: '23.534.432/0010-00')
        
        subsidiary.valid?

        expect(subsidiary.errors[:cnpj]).to include('não é válido')
      end
      
      it 'cnpj must be unique' do
        Subsidiary.create!(name: 'Fiat Rio',cnpj: '56.727.689/0001-05', address: 'rua verde')
        subsidiary = Subsidiary.new(name: 'Fiat Rio',cnpj: '56.727.689/0001-05', address: 'rua azul')

        subsidiary.valid?

        expect(subsidiary.errors[:cnpj]).to include('já está em uso')
      end
      
    end

    context '#name' do
      it 'name cannot be blank' do
        subsidiary = Subsidiary.new

        subsidiary.valid?

        expect(subsidiary.errors[:name]).to include('não pode ficar em branco')
      end
    end
  end
end
