require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    user = User.new(
      name: "たなか",
      email: "tester@example.com",
      password: "testpass"
      )
      expect(user).to be_valid
  end
  
  it "is invalid with a name 1 word" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("は1文字以上で入力してください")
  end
  
  it "is invalid without email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  
  it "is invalid without password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
  
  
end
