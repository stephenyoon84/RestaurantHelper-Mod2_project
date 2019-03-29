class User < ApplicationRecord
  has_secure_password
  validates :username, :phone_number, uniqueness: true
  validates :username, :phone_number, presence: true
  validates :phone_number, length: { is: 10 }

  has_many :carts
  has_many :menus, through: :carts

  def to_phone
    self.phone_number.to_s[0..2] + '-' + self.phone_number.to_s[3..5] + '-' + self.phone_number.to_s[6..9]
  end
end
