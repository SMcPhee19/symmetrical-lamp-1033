class Item < ApplicationRecord
  belongs_to :supermarket
  has_and_belongs_to_many :customers, join_table: :customers_items

  def add_item(item_params)
    item = Item.new(item_params)
    self.items << item
  end
end
