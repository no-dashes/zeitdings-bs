class Employee < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true, allow_blank: true,
    format: { with: /\A\w+@(\w+.)+\w+\Z/ }

  belongs_to :office, optional: true
  has_and_belongs_to_many :employee_tags
  has_many :comments, as: :commentable, dependent: :destroy

  def name
    "#{firstname} #{lastname}"
  end

end
