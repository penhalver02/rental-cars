class Subsidiary < ApplicationRecord
  validates :name, :cnpj, uniqueness: true 
  validates :name, :cnpj, :address, presence: true
  validates :cnpj, format: {with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/, message: 'nao e valido'}
  validate :cnpj_must_be_valid

  private

  def cnpj_must_be_valid
     unless CNPJ.valid?(cnpj)
      errors.add(:cnpj, 'nao e valido' )
    end
  end
end
