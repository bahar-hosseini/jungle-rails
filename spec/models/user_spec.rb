# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'password and password_confirmation should be match' do
      @user = User.new(name: 'Bahar', email: 'bahar@example.com', password: 'foobar',
                       password_confirmation: 'fo0000000obar')

      expect(@user.password).not_to be @user.password_confirmation
    end
    it 'name should not be empty' do
      @user = User.new(name: nil, email: 'bahar@example.com', password: 'fo0000000obar',
                       password_confirmation: 'fo0000000obar')

      expect(@user).to_not be_valid
    end
    it 'email should not be empty' do
      @user = User.new(name: nil, email: nil, password: 'fo0000000obar', password_confirmation: 'fo0000000obar')
      expect(@user).to_not be_valid
    end
    it 'password should not be empty' do
      @user = User.new(name: nil, email: 'bahar@example.com', password: nil, password_confirmation: 'fo0000000obar')
      expect(@user).to_not be_valid
    end
    it 'password_confirmation should not be empty' do
      @user = User.new(name: nil, email: 'bahar@example.com', password: 'fo0000000obar', password_confirmation: nil)
      expect(@user).to_not be_valid
    end
    it 'password has minimum length of 7 character' do
      @user = User.new(name: "bahar", email: 'bahar@example.com', password: 'fobar',
                       password_confirmation: 'fobar')
      expect(@user).to_not be_valid
    end

    it 'emails must be unique' do
      @user = User.new(name: 'john', email: 'john@example.com', password: 'fo0000000obar',
                       password_confirmation: 'fo0000000obar')
      @user.save!
      @user2 = User.new(name: 'john2', email: 'john@example.com', password: 'fo0000000obar',
                        password_confirmation: 'fo0000000obar')

      expect(@user2).to_not be_valid
    end
  end
  describe 'authenticate_with_credentials' do

    it 'valid if a visitor types in a few spaces before and/or after their email address' do
      @user8 = User.new(name: 'bahar', email: 'bahar8@example.com', password:'bbbbbbbbbbbbbbbbb', password_confirmation: 'bbbbbbbbbbbbbbbbb')
      @user8.save!
      @valid_user = User.authenticate_with_credentials(' bahar8@example.com ','bbbbbbbbbbbbbbbbb')
      puts "teeeeeessst#{@valid_user}"

      expect(@user8).to be_valid
    end
  end
end
