require 'rails_helper'

RSpec.describe Product, type: :model do
  
    describe 'Validations' do
      it 'is valid with valid attributes' do

        category = Category.create(name: 'Test Category')
        product = Product.new(
          name: 'Test Product',
          description: 'This is a test product',
          category_id: category.id,
          quantity: 10,
          price: 19.99
        )
        expect(product).to be_valid
      end

      it 'is not valid without a name' do\
        category = Category.create(name: 'Test Category')
        product = Product.new(
          name: nil, 
          description: 'Description', 
          category_id: category.id, 
          quantity: 1, 
          price: 10.99)
        expect(product).not_to be_valid
        expect(product.errors[:name]).to include("can't be blank")
      end


      it 'is not valid without a quantity value of 0 or greater' do
        category = Category.create(name: 'Test Category')
        product = Product.new(
          name: 'Product Name', 
          description: 'Description', 
          category_id: category.id, 
          quantity: nil, 
          price: 10.99)
        expect(product).not_to be_valid
        expect(product.errors[:quantity]).to include("can't be blank")
      end

      it 'is not valid without a price of 0 or greater' do
        category = Category.create(name: 'Test Category')
        product = Product.new(
          name: 'Product Name',
          description: 'Description',
          category_id: category.id,
          quantity: 1,
          price: -1
        )
      
        expect(product).not_to be_valid
        expect(product.errors[:price]).to include('must be greater than or equal to 0')
      end

      it 'is not valid without a category' do
        product = Product.new(
          name: 'Product Name', 
          description: 'Description', 
          category_id: nil, 
          quantity: 1, 
          price: 10.99)
        expect(product).not_to be_valid
        expect(product.errors[:category]).to include("can't be blank")
      end
    end
  
end
