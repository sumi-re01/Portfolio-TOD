require 'rails_helper'

RSpec.describe Gallery, type: :model do
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
    gallery = travel.gallery.create(
        text: "xxxxxxxxxxxxx",
        address: "Tokyo",
        images: "xxxxxxx.jpg"
        )
      expect(gallery).to be_valid
  end
end
