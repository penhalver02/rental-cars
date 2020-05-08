class Customer < ApplicationRecord
  validates :cpf, :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :name, :cpf, :email, presence: true
  validate :cpf_must_be_valid
  scope :search, ->(query) {where('name LIKE ?', "%#{query}%").or(where(cpf: query))}

  private

  def cpf_must_be_valid
    unless CPF.valid?(cpf)
      errors.add(:cpf, :invalid)
    end
  end
end
