class Menu < ApplicationRecord
  has_many :carts
  has_many :users, through: :carts

  validates :name, {presence: true, uniqueness: true}
  validates :price,{presence: true, numericality: {greater_than_or_equal_to: 1} }

end
