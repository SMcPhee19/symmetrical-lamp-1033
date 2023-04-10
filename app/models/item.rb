class Item < ApplicationRecord
  belongs_to :supermarket
  has_and_belongs_to_many :customers, join_table: :customers_items
end
