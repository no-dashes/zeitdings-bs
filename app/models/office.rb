class Office < ApplicationRecord
  validates :building, presence: true
  validates :floor, presence: true
  validates :number, presence: true

  has_many :employees, dependent: :nullify
  has_many :comments, as: :commentable, dependent: :destroy

  def name
    "#{building}:#{floor}:#{number}"
  end
end
