class Project < ApplicationRecord
  belongs_to :user
  # include ProfanityFilter
  validates_format_of :image_url, with: %r{\A(?:.+\.(png|jpe?g|gif|mp4))\z}i, message: "can only be png, jpg, jpeg, gif, or mp4 images/videos."


  validates :title, uniqueness: true
  validates :description, presence: true
  validates :is_public, inclusion: { in: [true, false] }
  validates :is_featured, inclusion: { in: [true, false] }
  validates :view_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def delete_after_sometimes
    update(archive: true)
    ProjectDeletionJob.set(wait: 1.hours).perform_later(id)
  end
end
