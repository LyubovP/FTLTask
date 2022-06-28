class Item < ApplicationRecord
  belongs_to :card
  include Searchable
  
  enum category: [:Traveling, :Clothing, :Taxi, :Cafes, :Shops, :Other].freeze
  
  validates :title, presence: true, length: { in: 3..128 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, inclusion: { in: Item::categories }
  
end
