class App < ApplicationRecord
  has_many :app_owners
  has_many :owners, through: :app_owners, source: :user
  has_many :app_users
  has_many :authorized_users, through: :app_users, source: :user
  before_save :decimalize_confidence

  def users_count
    authorized_users.count
  end

  private
  def decimalize_confidence
    self.min_confidence = self.min_confidence / 100.0
  end
end
