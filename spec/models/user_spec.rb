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

    it 'should not save a new user when email is a duplicate of another user' do
      @my_user.email = "willemail@gmail.com"
      @my_second_user.email = "willemail@gmail.com"
      @my_user.save
      @my_second_user.save
      expect(@user.errors.full_messages).to include("email")
    end

    it 'should let a new user log in even when they add random spaces to their email' do
    end

    it 'should should allow a user to log in regardless of the case they use for the letters of their email address' do
    end

  end


  describe '.authenticate_with_credentials' do

    #define new class method on User model authenticate_with_credentials (which should still use the authenticate instance method provided by the has_secure_password gem)
    #use this new class method in Sessions controller

    it 'returns nil if email address and password inputs do not match' do
    end
    
    it 'returns an instance of the user if email address and password inputs match' do
    end

  end

end