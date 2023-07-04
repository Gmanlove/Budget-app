require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Validations' do
    let(:user) { User.create(name: 'Tom') }
    let(:expense) { Expense.new(author: user, name: 'expense1', amount: 4.0) }

    it 'name should be present' do
      expense.name = ''
      expect(expense).to_not be_valid
    end

    it 'amount should be present' do
      expense.amount = nil
      expect(expense).to_not be_valid
    end

    it 'amount should be a number' do
      expense.amount = 'p'
      expect(expense).to_not be_valid
    end

    it 'amount should be greater than or equal to zero' do
      expense.amount = -1
      expect(expense).to_not be_valid
    end
  end
end
