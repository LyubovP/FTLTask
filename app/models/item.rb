class Item < ApplicationRecord
  belongs_to :card
  
  validates :title, presence: true, length: { in: 3..128 }
  validates :price, presence: true
  
end
