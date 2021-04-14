class Plan < ApplicationRecord

  # itineraryの細かな予定がplan
  belongs_to :itinerary
  acts_as_list scope: :itinerary

  validates :text, length:{maximum: 20}

end
