require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) { User.new(name: 'Emma') }

    it 'validates presence of name' do
      user.name = ''
      expect(user).not_to be_valid
    end
  end
end
