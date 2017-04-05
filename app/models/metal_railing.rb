class MetalRailing < ApplicationRecord
  belongs_to :metal_photo
  has_attached_file :photos, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photos, content_type: /\Aimage\/.*\z/
end
