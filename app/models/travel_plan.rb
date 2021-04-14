class TravelPlan < ApplicationRecord

  belongs_to :travel
  acts_as_list scope: :travel

  validates :text, length:{maximum: 20}, presence: true

end
