class User < ApplicationRecord
  # attr_accessor :password
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
