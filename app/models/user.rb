class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true 
  validates :name, presence: true
  validates :password, presence: true
  has_many :favorites

  has_secure_password
end
