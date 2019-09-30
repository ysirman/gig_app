require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is valid with a name, email, and password' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  
  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include(I18n.t :'errors.messages.blank')
  end

  it 'is invalid without a login_name' do
    user = FactoryBot.build(:user, login_name: nil)
    user.valid?
    expect(user.errors[:login_name]).to include(I18n.t :'errors.messages.blank')
  end
  
  it 'is invalid without an email address' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t :'errors.messages.blank')
  end
  
  it 'is invalid without a password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include(I18n.t :'errors.messages.blank')
  end
  
  it 'is invalid without a region' do
    user = FactoryBot.build(:user, region: nil)
    user.valid?
    expect(user.errors[:region]).to include(I18n.t :'errors.messages.blank')
  end
  
  it 'is invalid without a genre' do
    user = FactoryBot.build(:user, genre: nil)
    user.valid?
    expect(user.errors[:genre]).to include(I18n.t :'errors.messages.blank')
  end
  
  it 'is invalid with a duplicate email address' do
    duplicate_email = 'tester@example.com'
    FactoryBot.create(:user, email: duplicate_email)
    user = FactoryBot.build(:user, email: duplicate_email)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t :'errors.messages.taken')
  end

  it 'is invalid with a duplicate login_name' do
    duplicate_login_name = 'hogesan'
    FactoryBot.create(:user, login_name: duplicate_login_name)
    user = FactoryBot.build(:user, login_name: duplicate_login_name)
    user.valid?
    expect(user.errors[:login_name]).to include(I18n.t :'errors.messages.taken')
  end
end
