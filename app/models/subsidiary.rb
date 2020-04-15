class Subsidiary < ApplicationRecord
  validates :name, uniqueness: {message: 'Nome deve ser único'}
  validates :cnpj, uniqueness: {message: 'Cnpj deve ser único'}
  validates :name, :cnpj, :address, presence: {message: 'Todos atributos não podem ficar em branco'}
end
