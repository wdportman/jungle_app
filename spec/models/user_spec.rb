require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before do
      @my_user = User.new(
        fname: 'Will',
        lname: 'Portman',
        email: 'willemail@gmail.com',
        password: '123password',
        password_confirmation: '123password'
      )
      @my_second_user = User.new(
        fname: 'Will',
        lname: 'Portman',
        email: 'willemail@gmail.com',
        password: '123password',
        password_confirmation: '123password'
      )
    end
    
    it 'should save a new user when all required fields are valid' do
      expect(@my_user).to be_valid
    end

    it 'should not save a new user when the password and password_confirmation fields do not match' do
      @my_user.password_confirmation = '124password'
      expect(@my_user).not_to be_valid
    end
    
    it 'should not save a new user when email is missing' do
      @my_user.email = nil
      expect(@my_user).not_to be_valid
    end

    it 'should not save a new user when first name is missing' do
      @my_user.fname = nil
      expect(@my_user).not_to be_valid
    end

    it 'should not save a new user when last name is missing' do
      @my_user.lname = nil
      expect(@my_user).not_to be_valid
    end

    it 'should not save a new user when password is missing' do
      @my_user.password = nil
      expect(@my_user).not_to be_valid
    end

    it 'should not save a new user when password_confirmation is missing' do
      @my_user.password_confirmation = nil
      expect(@my_user).not_to be_valid
    end

    it 'should not save a new user when password is less than 8 characters' do
      @my_user.password = 'abc'
      @my_user.password_confirmation = 'abc'
      expect(@my_user).not_to be_valid
    end

    it "should validate a user if the email and password match" do
      @my_user.save
      @my_user_validated = User.authenticate_with_credentials(@my_user.email, @my_user.password)
      expect(@my_user).to eq(@my_user_validated)
    end

    it 'should not save a new user when email is a duplicate of another user' do
      @my_user.save
      @my_second_user.save
      expect(@my_second_user.errors).to be_present
    end

    it 'should let a new user log in even when they add random spaces to their email' do
      @my_user.save
      @my_user_validated = User.authenticate_with_credentials("    willemail@gmail.com   ", @my_user.password)
      expect(@my_user).to eq(@my_user_validated)
    end

    it 'should should allow a user to log in regardless of the case they use for the letters of their email address' do
      @my_user.save
      @my_user_validated = User.authenticate_with_credentials("wIlLeMaIl@GmAiL.cOm", @my_user.password)
      expect(@my_user).to eq(@my_user_validated)
    end

  end


  describe '.authenticate_with_credentials' do

    before do
      @my_user = User.new(
        fname: 'Will',
        lname: 'Portman',
        email: 'willemail@gmail.com',
        password: '123password',
        password_confirmation: '123password'
      )
      @my_second_user = User.new(
        fname: 'Will',
        lname: 'Portman',
        email: 'willemail@gmail.com',
        password: '123password',
        password_confirmation: '123password'
      )
    end

    it 'returns nil if email address and password inputs do not match' do
      @my_user.save
      @my_user_validated = User.authenticate_with_credentials("NotWillsEmail@gmail.com", @my_user.password)
      expect(@my_user_validated).to eq(nil)
    end
    
    it 'returns an instance of the user if email address and password inputs match' do
      @my_user.save
      @my_user_validated = User.authenticate_with_credentials("willemail@gmail.com", @my_user.password)
      expect(@my_user_validated).to eq(@my_user)
    end

  end

end