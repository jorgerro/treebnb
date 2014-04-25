
class Picture < ActiveRecord::Base

  validates :room_id, presence: true

  belongs_to :room

  has_attached_file :image, styles: { thumb_big: "250x250>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
