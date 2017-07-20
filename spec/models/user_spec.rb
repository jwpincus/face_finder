require 'rails_helper'

RSpec.describe User, type: :model do
  it "A valid User has a first name email and password" do
    expect(User.new(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'pass')).to be_valid
  end
  it "A valid User has a unique email and password" do
    expect(User.create(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'pass')).to be_valid
    user = User.new(first_name: "2nd", email: "1@1.com", password: "pass", password_confirmation: 'pass')
    expect(user.save).to eq(false)
  end
  it "A user without email is invalid" do
    expect(User.new(first_name: "Jack", password: "pass", password_confirmation: 'pass')).to_not be_valid
  end
  it "A User without first_name is invalid" do
    expect(User.new( email: "1@1.com", password: "pass", password_confirmation: 'pass')).to_not be_valid
  end
  it "A User without mathching password confirmation is invlaid" do
    expect(User.new(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'word')).to_not be_valid
  end
  it "A User without mathching password confirmation is invlaid" do
    user = User.create(first_name: "Jack", email: "UPCASE@1.com", password: "pass", password_confirmation: 'pass')
    expect(user.email).to eq('upcase@1.com')
  end
end
