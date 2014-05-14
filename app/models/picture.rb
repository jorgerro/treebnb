require 'open-uri'
class Picture < ActiveRecord::Base

  validates :room, presence: true

  belongs_to :room, inverse_of: :pictures

  has_attached_file :image, styles: { thumb: "100x100#", profile: "580x400#" }, default_url: "https://s3.amazonaws.com/freebnb_dev/front_page/default_treehouse.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def image_from(url)
    self.image = URI.parse(url)
  end

end