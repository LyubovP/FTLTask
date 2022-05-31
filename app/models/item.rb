class Item < ApplicationRecord
  belongs_to :card
  
  enum category: [:Traveling, :Clothing, :Taxi, :Cafes, :Shops, :Other]
  
  validates :title, presence: true, length: { in: 3..128 }
  validates :price, presence: true
  validates :category, inclusion: { in: Item::categories }
end
