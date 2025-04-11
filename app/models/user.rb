class User < ApplicationRecord
  # Include default devise modules. Available modules are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association: A user can have many routes.
  # When a user is destroyed, all associated routes will also be destroyed.
  has_many :routes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  # Similarly, include other associations if needed, e.g.:
  # has_many :bookings, dependent: :destroy
  # has_many :feedbacks, dependent: :destroy
end
