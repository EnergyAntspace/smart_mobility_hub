class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :route

  # Ensure that booked_at is present
  validates :booked_at, presence: true

end
