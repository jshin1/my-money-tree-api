class User < ApplicationRecord
  has_many :assets
  has_many :liabilities
  has_many :incomes
  has_many :expenses

  has_secure_password
  # validates :username, uniqueness: true, presence:true
  # validates :password, presence: true
end
