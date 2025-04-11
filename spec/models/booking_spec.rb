require 'rails_helper'

RSpec.describe Booking, type: :model do
  it "is valid with valid attributes" do
    user = User.create!(email: "booking_test@example.com", password: "password")
    route = user.routes.create!(origin: "Start Point", destination: "End Point", distance: 15.0, duration: 30.0)
    booking = user.bookings.new(route: route, status: "pending", booked_at: Time.current)
    expect(booking).to be_valid
  end

  it "is not valid without a route" do
    user = User.create!(email: "booking_test@example.com", password: "password")
    booking = user.bookings.new(status: "pending", booked_at: Time.current)
    expect(booking).to_not be_valid
  end

  it "is not valid without a booked_at date" do
    user = User.create!(email: "booking_test@example.com", password: "password")
    route = user.routes.create!(origin: "Start Point", destination: "End Point", distance: 15.0, duration: 30.0)
    booking = user.bookings.new(route: route, status: "pending")
    expect(booking).to_not be_valid
  end
end
