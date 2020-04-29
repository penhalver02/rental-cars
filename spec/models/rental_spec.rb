require 'rails_helper'

RSpec.describe Rental, type: :model do
  context 'validation' do
    it 'start date cannot be blank' do
      rental = Rental.new

      rental.valid?

      expect(rental.errors[:start_date]).to include('não pode ficar em branco')
    end

    it 'end date cannot be blank' do
      rental = Rental.new

      rental.valid?

      expect(rental.errors[:end_date]).to include('não pode ficar em branco')
    end

  end
end
