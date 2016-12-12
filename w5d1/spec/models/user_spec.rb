require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  let (:isai) { User.create(name: 'Isai', password: 'password17') }

  describe '#is_password?' do
    it "validates password inputted by user" do
      expect(isai.is_password?('password17')).to be true
    end
  end

  describe '#reset_session_token!' do
    it "changes user's session_token" do
      old_token = isai.session_token
      isai.reset_session_token!
      expect(isai.session_token).to_not eq(old_token)
    end
  end

  before(:each) { isai.save! }

  describe '.find_by_credentials?' do
    it "returns user if password is good" do
      user = User.find_by_credentials('Isai', 'password17')
      expect(user).to eq(isai)
    end

    it "returns nil if password is bad" do
      user = User.find_by_credentials('Isai', 'password16')
      expect(user).to be_nil
    end
  end
end
