class Task < ApplicationRecord
  enum status: { not_yet: 0, done: 1 }
end
