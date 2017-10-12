require 'rspec'
require 'user'

describe User do

  describe '::find_user' do
    it 'selects user with correct id' do
      expect(User.find_user(3).flatten).to include('3', 'andrew@email.com')
      expect(User.find_user(3).flatten).not_to include('1', 'jill@email.com')
    end
  end

  describe '#increment_count' do
    user = User.new(22, 'josh@email.com')
    num_keys = user.numLicenseKeysSent

    user.increment_count
    it 'adds 1 to numLicenseKeysSent' do
      expect(user.numLicenseKeysSent).to eq(1)
    end

  end
  
end