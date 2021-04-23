class Travel < ApplicationRecord

  belongs_to :user
  has_many :travel_plans, -> { order(position: :asc)}
  has_many :gallery, dependent: :destroy

  validates :title, presence: true, length:{maximum: 10}
  validates :date, presence: true

end
