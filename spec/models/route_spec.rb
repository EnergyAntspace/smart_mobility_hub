require 'rails_helper'

RSpec.describe Route, type: :model do
  it "is valid with valid attributes" do
    user = User.create!(email: "test@example.com", password: "password")
    route = user.routes.new(origin: "Point A", destination: "Point B", distance: 10.0, duration: 20.0)
    expect(route).to be_valid
  end

  it "is not valid without an origin" do
    user = User.create!(email: "test@example.com", password: "password")
    route = user.routes.new(destination: "Point B", distance: 10.0, duration: 20.0)
    expect(route).to_not be_valid
  end
end
