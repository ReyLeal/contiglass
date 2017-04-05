class Photo < ApplicationRecord
  has_many :all_photos
  has_many :glass_photos
  has_many :metal_photos
end
