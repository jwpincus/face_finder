class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :enrollments

  def enrolled?
    enrollments.count >= 1 ? true : false
  end
end
