require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it 'should save a new user when all required fields are valid' do
    end

    it 'should not save a new user when the password and password_confirmation fields do not match' do
    end
    
    it 'should not save a new user when email is a duplicate of another user' do
    end
    
    it 'should not save a new user when email is missing' do
    end

    it 'should not save a new user when first name is missing' do
    end

    it 'should not save a new user when last name is missing' do
    end

    it 'should not save a new user when password is missing' do
    end

    it 'should not save a new user when password_confirmation is missing' do
    end

    it 'should not save a new user when password is less than 8 characters' do
    end

    it 'should let a new user log in even when they add random spaces to their email' do
    end

    it 'should should allow a user to log in regardless of the case they use for the letters of their email address' do
    end

  end


  describe '.authenticate_with_credentials' do

    #define new class method on User model authenticate_with_credentials (which should still use the authenticate instance method provided by the has_secure_password gem)
    #use this new class method in Sessions controller
    
    it 'returns an instance of the user if email address and password inputs are valid'
    end

    if 'returns nil if email address and password inputs are not valid'

  end

end
