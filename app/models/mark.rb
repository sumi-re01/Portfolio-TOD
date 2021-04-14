class Mark < ApplicationRecord

  belongs_to :user
  belongs_to :gallery

  validates_uniqueness_of :gallery_id, scope: :user_id
end
