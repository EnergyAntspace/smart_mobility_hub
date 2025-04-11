class Route < ApplicationRecord
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :distance, numericality: { greater_than: 0 }
  validates :duration, numericality: { greater_than: 0 }
end
