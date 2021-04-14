class Travel < ApplicationRecord

  belongs_to :user
  has_many :travel_plans, -> { order(position: :asc)}
  has_one :gallery

  validates :title, presence: true
  validates :date, presence: true

end
