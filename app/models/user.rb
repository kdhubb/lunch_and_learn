class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true 
  validates :name, presence: true
  validates :password, presence: true

  has_secure_password
end
