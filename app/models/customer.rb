class Customer < ApplicationRecord
  validates :cpf, uniqueness: {message: 'CPF deve ser único'}
  validates :email, uniqueness: {message: 'Email deve ser único'} 
  validates :name, :cpf, :email, presence: {message: 'Todos atributos não podem ficar em branco'}
end
