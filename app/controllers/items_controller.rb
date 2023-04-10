class ItemsController < ApplicationController
  def create
    require 'pry'; binding.pry
    @customer = Customer.find(params[:id])
    @item = @customer.add_item(item_params)
    
    if @customer.save
      redirect_to "/customers/#{@customer.id}"
    else
      render 'Failed to add item'
    end
  end
  
end