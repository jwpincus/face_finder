class Enrollment < ApplicationRecord
  belongs_to :user

  def send_to_kairos
    response = KairosService.enroll(self)
    self.update_attributes(response: response)
  end
end
