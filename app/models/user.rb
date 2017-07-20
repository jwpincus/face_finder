class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :enrollments
  before_save :downcase_email

  def enrolled?
    enrollments.count >= 1 ? true : false
  end

  def visual_auth(image, user_id)
    KairosService.visual_auth(image, user_id)
  end

  private

  def downcase_email
    self.email.downcase!
  end
end
