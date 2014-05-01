
class Picture < ActiveRecord::Base

  validates :room, presence: true

  belongs_to :room, inverse_of: :pictures

  has_attached_file :image, styles: { thumb_big: "250x250>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end


# should have a profile view size: height 400 width 580?