class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  validates :text, presence: true

end
