require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it "is valid with valid attributes" do
    user = User.create!(email: "feedback_test@example.com", password: "password")
    feedback = user.feedbacks.new(content: "Great service!", rating: 5)
    expect(feedback).to be_valid
  end

  it "is not valid without content" do
    user = User.create!(email: "feedback_test@example.com", password: "password")
    feedback = user.feedbacks.new(rating: 4)
    expect(feedback).to_not be_valid
  end

  it "is not valid if rating is out of range" do
    user = User.create!(email: "feedback_test@example.com", password: "password")
    feedback = user.feedbacks.new(content: "Good", rating: 10)
    expect(feedback).to_not be_valid
  end
end
