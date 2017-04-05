class GlassPhoto < ApplicationRecord
  belongs_to :photo
  has_many :glass_elevators
  has_many :glass_railings
  has_many :glass_stairs
  has_many :glass_wine_rooms
  has_many :glass_windows_doors
  has_many :glass_floors
  has_many :glass_shower_doors
  has_many :other_glass_structures

end
