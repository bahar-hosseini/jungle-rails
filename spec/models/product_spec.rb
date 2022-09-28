# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validate name,' do
      @category = Category.new(name: 'evergreen')
      @product = Product.new(name: 'plant2', price_cents: 64.49, quantity: 12, category: @category)
      @product.save!

      expect(@product.name).to be_present
    end

    it 'validate name' do
      @category = Category.new(name: 'evergreen')
      @product = Product.new(name: 'plant2', price_cents: 64.49, quantity: 12, category: @category)
      @product.save!

      @product.name = nil
      expect(@product).to_not be_valid
      @product.errors.full_message(:name, "your code doesn't chack name validation")
    end
    it 'validate price_cents' do
      @category = Category.new(name: 'evergreen')
      @product = Product.new(name: 'plant2', price_cents: 64.49, quantity: 12, category: @category)
      @product.save!

      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    it 'validate quantity' do
      @category = Category.new(name: 'evergreen')
      @product = Product.new(name: 'plant2', price_cents: 64.49, quantity: 12, category: @category)
      @product.save!

      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it 'validate category' do
      @category = Category.new(name: 'evergreen')
      @product = Product.new(name: 'plant2', price_cents: 64.49, quantity: 12, category: @category)
      @product.save!

      @product.category = nil
      expect(@product).to_not be_valid
    end
end
