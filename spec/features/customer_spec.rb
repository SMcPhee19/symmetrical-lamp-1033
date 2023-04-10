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
      expect(page).to have_content('Customer')
    end

    it 'displays the customer name' do
      visit "/customers/#{@john.id}"
      expect(page).to have_content('Name: John')
    end

    it 'displays the customer items' do
      visit "/customers/#{@john.id}"
      expect(page).to have_content('Banana 1 Whole Foods')
      expect(page).to have_content('Apple 2 Whole Foods')
      expect(page).to have_content('Orange 3 Whole Foods')
    end
  end

  describe 'user story 2' do
    it 'displays a form to add an item' do
      visit "/customers/#{@john.id}"
      expect(page).to have_content('Add Item')
      expect(page).to have_field('Name')
      expect(page).to have_field('Price')
      expect(page).to have_field('Supermarket')
    end

    it 'can add an item' do
      visit "/customers/#{@john.id}"

      fill_in 'Name', with: 'Grapes'
      fill_in 'Price', with: 4
      fill_in 'Supermarket', with: 'Trader Joes'
      click_button 'Save'

      expect(current_path).to eq("/customers/#{j@ohn.id}")
      expect(page).to have_content('Grapes 4 Trader Joes')
    end
  end
end