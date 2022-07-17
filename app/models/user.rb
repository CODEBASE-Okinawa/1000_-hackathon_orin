class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :comments

  has_secure_password
end
