class List < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :project
  has_many :tasks
end
