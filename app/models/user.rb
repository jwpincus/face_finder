class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :enrollments
  has_many :app_owners
  has_many :apps, through: :app_owners
  has_many :app_users
  has_many :authorizations, through: :app_users, source: :app
  before_save :downcase_email

  def enrolled?
    enrollments.count >= 1 ? true : false
  end

  def visual_auth(image, user_id)
    KairosService.visual_auth(image, user_id)
  end

  def enrollment_image
    enrollments.count > 0 ? enrollments.first.image : "User has no reference image: Authentication not possible"
  end
  private

  def downcase_email
    self.email.downcase!
  end
end
