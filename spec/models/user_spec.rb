require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'is not valid without matching password and password_confirmation' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'different_password'
      )
      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is not valid without a password' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: nil,
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
     

      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is not valid with a non-unique email (case-insensitive)' do
      existing_user = User.create(
        first_name: 'Existing',
        last_name: 'User',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'TEST@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end

    #Email is required.
    it 'is not valid without an email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    #First name is required
    it 'is not valid without a first name' do
      user = User.new(
        first_name: nil,
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    #Last name is required
    it 'is not valid without a last name' do
      user = User.new(
        first_name: 'John',
        last_name: nil,
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors[:last_name]).to include("can't be blank")
    end
  end
end
