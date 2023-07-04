require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    let(:user) { User.create(name: 'Emma') }
    let(:category) do
      Category.new(author: user, name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
    end

    it 'validates presence of name' do
      category.name = ''
      expect(category).not_to be_valid
    end

    it 'validates presence of icon' do
      category.icon = ''
      expect(category).not_to be_valid
    end
  end
end
