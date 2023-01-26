class Employee < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true, allow_blank: true,
    format: { with: /\A\w+@(\w+.)+\w+\Z/ }

  belongs_to :office, optional: true
  has_and_belongs_to_many :employee_tags
  has_many :comments, as: :commentable, dependent: :destroy

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :microthumb, resize_to_limit: [50, 50]
  end

  def name
    "#{firstname} #{lastname}"
  end

end
