class Customer < ApplicationRecord
  has_and_belongs_to_many :items, join_table: :customers_items
end