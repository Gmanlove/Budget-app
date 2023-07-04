require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  describe 'Associations' do
    let(:user) { User.create(name: 'Emma') }
    let(:category) { user.categories.create(name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png') }
    let(:expense) { user.expenses.create(name: 'expense1', amount: 4.0) }
    let(:expense_category) { ExpenseCategory.new(expense: expense, category: category) }

    it 'belongs to the correct category' do
      expect(expense_category.category).to eq(category)
    end

    it 'belongs to the correct expense' do
      expect(expense_category.expense).to eq(expense)
    end
  end
end
