require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a new product when all required fields are supplied' do
      my_category = Category.new
      my_product = Product.new(
        name: "Will's Authentic Clogs",
        price: 500,
        quantity: 1,
        category: my_category
        )
      expect(my_product).to be_valid
    end
    it 'should not save a new product when name field is missing' do
      my_category = Category.new
      my_product = Product.new(
        price: 500,
        quantity: 1,
        category: my_category
        )
      expect(my_product).not_to be_valid
    end
    it 'should not save a new product when price field is missing' do
      my_category = Category.new
      my_product = Product.new(
        name: "Will's Authentic Clogs",
        quantity: 1,
        category: my_category
        )
      expect(my_product).not_to be_valid
    end
    it 'should not save a new product when quantity field is missing' do
      my_category = Category.new
      my_product = Product.new(
        name: "Will's Authentic Clogs",
        price: 500,
        category: my_category
        )
      expect(my_product).not_to be_valid
    end
    it 'should not save a new product when category field is missing' do
      my_product = Product.new(
        name: "Will's Authentic Clogs",
        price: 500,
        quantity: 1,
        )
      expect(my_product).not_to be_valid
    end

  end
end
