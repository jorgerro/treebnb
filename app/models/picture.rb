require 'open-uri'
class Picture < ActiveRecord::Base

  validates :room, presence: true

  belongs_to :room, inverse_of: :pictures

  has_attached_file :image, styles: { thumb: "100x100!", profile: "580x400!" }, default_url: "https://s3.amazonaws.com/freebnb_dev/resized_treehouses/amazing-treehouses-4.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def picture_from(url)
    self.image = open(url)
  end

end