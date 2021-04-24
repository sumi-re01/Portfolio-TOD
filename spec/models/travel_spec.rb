require 'rails_helper'

RSpec.describe Travel, type: :model do
  it "is valid with " do
    user = User.create(
      name: "たなか",
      email: "tester@example.com",
      password: "testpass"
      )
    travel = user.travels.create(
      title: "旅行名",
      date: "2021/01/01"
      )
      expect(travel).to be_valid
  end
  
  it "is invalid with a name 1 word" do
     user = User.create(
      name: "たなか",
      email: "tester@example.com",
      password: "testpass"
     )
    travel = user.travels.create(title: nil)
    travel.valid?
    expect(travel.errors[:title]).to include("を入力してください")
  end
end
