class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true

  has_many :carts
  has_many :menus, through: :carts
end
