class Enrollment < ApplicationRecord
  belongs_to :user

  def enroll
    KairosService.enroll(self)
  end
end
