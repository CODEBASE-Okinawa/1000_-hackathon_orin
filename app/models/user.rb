class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :comments
  has_many :user_projects
  has_many :projects, through: :user_projects

  has_secure_password
end
