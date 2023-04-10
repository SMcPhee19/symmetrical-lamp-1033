require 'rails_helper'

RSpec.describe 'Customer', type: :feature do
  before(:each) do
    @john = Customer.create(name: 'John')
    @banana = @john.item.create(name: 'Banana', price: 1)
    @apple = @john.item.create(name: 'Apple', price: 2)
    @orange = @john.item.create(name: 'Orange', price: 3)
  end

  describe 'user story 1' do
    it 'has a header' do
      
    end
  end
end