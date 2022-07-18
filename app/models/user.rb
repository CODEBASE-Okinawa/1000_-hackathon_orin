class User < ApplicationRecord
  after_create :set_hash_name

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :comments
  has_many :user_projects
  has_many :projects, through: :user_projects

  has_secure_password

  private
  def set_hash_name
    update(name: SecureRandom.hex(10))
  end
end
