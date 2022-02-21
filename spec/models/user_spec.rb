require 'rails_helper'

RSpec.describe User, type: :model do
  context 'before signup' do  
    subject(:user) { User.new }

    it 'new User object' do   
      expect(user).to be_a_new(User)
    end

    it 'id is nil' do
      expect(user.id).to be(nil)
    end

    it 'username is nil' do
      expect(user.username).to be(nil)
    end

    it 'email is nil' do
      expect(user.email).equal?("")
    end

    it 'password is nil' do
      expect(user.password).to be(nil)
    end

  end

  context 'Validation checks' do
    it 'username should not be empty' do
      user = FactoryBot.build(:user, username: "")
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:username].any?).to be true
    end

    it 'email should not be empty' do
      user = FactoryBot.build(:user, email: "")
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:email].any?).to be true
    end

    it 'password is required' do
      user = FactoryBot.build(:user, password: "")
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
    end

    it 'invalid email not accepted' do
      user = FactoryBot.build(:user, email: "somemailgmail.com")
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:email].any?).to be true
    end

    it 'password should be more than 8 char' do
      user = FactoryBot.build(:user, password: "Wrong@1")
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
    end

    it 'password should have at least one uppercase' do
      user = FactoryBot.build(:user, password: "wrong1234")
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
    end

    it 'password should have atleast one digit' do
      user = FactoryBot.build(:user, password: "WRONGPSSWD")
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
    end
  end
end
