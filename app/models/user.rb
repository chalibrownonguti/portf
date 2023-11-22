class User < ApplicationRecord
  has_secure_password
  has_many :projects
  before_save :hash_email

  validates :name, presence: true, length: { maximum: 255 }
  # validates :is_admin, inclusion: { in: [true, false] }
  validates :profile_image, length: { maximum: 255 }
  validates :gender, inclusion: { in: %w(male female other) }, allow_blank: true
  validates :date_of_birth, presence: true
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :hashed_email, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 8, maximum: 20 }
  validates :password, presence: true, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*\(\)_\+\-\={}<>,\.\|\\~`:";\/\?\[\]\)\(])[A-Za-z\d!@#\$%\^&\*\(\)_\+\-\={}<>,\.\|\\~`:";\/\?\[\]\)\(]{8,}\z/, message: "must include at least one uppercase letter, one lowercase letter, one digit, and one special character" }


#   validates :email, presence: true, uniqueness: true
#   validates :password, presence: true, length: { minimum: 8 }
#   validates :date_of_birth, presence: true


  # ... other model code ...

 private

  def hash_email
    self.hashed_email = Digest::SHA256.hexdigest(self.hashed_email.to_s)
  end
end
