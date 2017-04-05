class MetalPhoto < ApplicationRecord
  belongs_to :photo
  has_many :metal_railings
  has_many :metal_fabrications
end
