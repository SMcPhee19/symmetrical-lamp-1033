require 'rails_helper'

RSpec.describe 'Customer', type: :feature do
  before(:each) do
    @john = Customer.create!(name: 'John')
    @supermarket = Supermarket.create!(name: 'Whole Foods', location: '123 Food St.')
    @banana = @john.items.create!(name: 'Banana', price: 1, supermarket: @supermarket)
    @apple = @john.items.create!(name: 'Apple', price: 2, supermarket: @supermarket)
    @orange = @john.items.create!(name: 'Orange', price: 3, supermarket: @supermarket)
  end

  describe 'user story 1' do
    it 'has a header' do
      visit "/customers/#{@john.id}"
      expect(page).to have_content('Customers')
    end

    it 'displays the customer name' do
      visit "/customers/#{@john.id}"
      expect(page).to have_content('john')
    end

    it 'displays the customer items' do
      visit "/customers/#{@john.id}"
      save_and_open_page
      expect(page).to have_content('Banana')
      expect(page).to have_content('Apple')
      expect(page).to have_content('Orange')
    end
  end
end