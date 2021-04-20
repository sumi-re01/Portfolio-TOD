class Gallery < ApplicationRecord

  belongs_to :travel
  has_many :marks, dependent: :destroy

  mount_uploaders :images, ImageUploader

  validates :text, presence: true
  validates :images, presence: true
  validates :public_status, inclusion: { in: [true, false] }
  validates :address, presence: true

  def marked_by?(user)
    marks.where(user_id: user.id).exists?
  end

end
