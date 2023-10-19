class Project < ApplicationRecord
      # belongs_to :user
  validates :title, uniqueness: true
  validates :description, presence: true
  validates :is_public, inclusion: { in: [true, false] }
  validates :is_featured, inclusion: { in: [true, false] }
  validates :view_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
