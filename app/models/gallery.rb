class Gallery < ApplicationRecord

  belongs_to :travel
  has_many :marks, dependent: :destroy

  validates :text, presence: true

end
