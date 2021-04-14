class Gallery < ApplicationRecord

  belongs_to :itinerary
  has_many :marks, dependent: :destroy

  validates :text, presence: true

end
