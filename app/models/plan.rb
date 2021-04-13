class Plan < ApplicationRecord

  belongs_to :itinerary
  acts_as_list scope: :itinerary

  validates :plan, length:{maximum: 20}

end
