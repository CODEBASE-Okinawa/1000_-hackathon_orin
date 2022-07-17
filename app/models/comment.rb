class Comment < ApplicationRecord
  validates :description, presence: true

  belongs_to :task
  belongs_to :user
end
