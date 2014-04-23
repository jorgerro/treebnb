
class Review < ActiveRecord::Base

  validates :body, :author_id, :reviewable_id, :reviewable_type, presence: true

  belongs_to :reviewable, polymorphic: true

  belongs_to(
  :author,
  class_name: "User",
  foreign_key: :author_id,
  primary_key: :id  )

end
