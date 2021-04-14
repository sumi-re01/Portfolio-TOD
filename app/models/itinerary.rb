class Itinerary < ApplicationRecord

  belongs_to :user
  has_many :plans, -> { order(position: :asc)}
  has_one :gallery

  validates :date, presence: true
end
