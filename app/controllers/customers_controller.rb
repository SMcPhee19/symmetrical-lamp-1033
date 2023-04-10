class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @items = @customer.items
    # require 'pry'; binding.pry
  end  
end