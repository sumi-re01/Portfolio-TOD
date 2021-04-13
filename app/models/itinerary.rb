class Itinerary < ApplicationRecord

  belongs_to :user
  has_many :plans, -> { order(position: :asc)}

  validates :date, presence: true
end
