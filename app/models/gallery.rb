class Gallery < ApplicationRecord

  belongs_to :travel
  has_many :marks, dependent: :destroy
  has_many :gallery_images, dependent: :destroy
  accepts_attachments_for :gallery_images, attachment: :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :text, presence: true
  validates :public_status, inclusion: { in: [true, false] }

end
