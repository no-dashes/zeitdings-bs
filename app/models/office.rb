class Office < ApplicationRecord
  validates :building, presence: true
  validates :floor, presence: true
  validates :number, presence: true

  has_many :employees
end
