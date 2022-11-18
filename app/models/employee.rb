class Employee < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true, allow_blank: true,
    format: { with: /\A\w+@(\w+.)+\w+\Z/ }

  belongs_to :office, optional: true

  def name
    "#{firstname} #{lastname}"
  end

end
