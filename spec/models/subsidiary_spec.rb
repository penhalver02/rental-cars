require 'rails_helper'

RSpec.describe Subsidiary, type: :model do
  context 'validation' do
    it 'name cannot be blank' do
      subsidiary = Subsidiary.new

      subsidiary.valid?

      expect(subsidiary.errors[:name]).to include('Todos atributos não podem ficar em branco')
      expect(subsidiary.errors[:cnpj]).to include('Todos atributos não podem ficar em branco')
      expect(subsidiary.errors[:address]).to include('Todos atributos não podem ficar em branco')
    end

    it 'and name must be uniq' do
      Subsidiary.create!(name: 'Fiat Rio',cnpj: '12345', address: 'rua verde')
      subsidiary = Subsidiary.new(name: 'Fiat Rio',cnpj: '5680', address: 'rua azul')
      
      subsidiary.valid?

      expect(subsidiary.errors[:name]).to include('Nome deve ser único')
    end
  end
end
