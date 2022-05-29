class Card < ApplicationRecord
  belongs_to :user
  
  enum category: [:Trip, :Event, :House, :Shoping]
  enum currency: [:UAH, :USD]
  
  validates :title, presence: true, length: { in: 3..128 }
  validates :description, presence: true, length: { in: 5..300 }
  validates :category, inclusion: { in: Card::categories }
  validates :currency, inclusion: { in: Card::currencies }
end
