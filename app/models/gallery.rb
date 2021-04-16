class Gallery < ApplicationRecord

  belongs_to :travel
  has_many :marks, dependent: :destroy

  mount_uploaders :images, ImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :text, presence: true
  validates :public_status, inclusion: { in: [true, false] }

end
