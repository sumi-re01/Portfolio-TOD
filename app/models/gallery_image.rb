class GalleryImage < ApplicationRecord

  belongs_to :gallery

  attachment :image

end
