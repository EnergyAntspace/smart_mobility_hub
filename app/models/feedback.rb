class Feedback < ApplicationRecord
  belongs_to :user

  # Ensure that content is present
  validates :content, presence: true

  # Validate that rating is within a valid range (1 through 5)
  validates :rating, inclusion: { in: 1..5 }
end
