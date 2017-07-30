class App < ApplicationRecord
  has_many :app_owners, dependent: :destroy
  has_many :owners, through: :app_owners, source: :user
  has_many :app_users, dependent: :destroy
  has_many :authorized_users, through: :app_users, source: :user
  has_many :authentications, dependent: :destroy
  before_save :decimalize_confidence
  before_save :add_hex_key

  def users_count
    authorized_users.count
  end


  private
  def decimalize_confidence
    self.min_confidence = self.min_confidence / 100.0
  end

  def add_hex_key
    begin
      self.app_key = SecureRandom.hex(10)
    end while self.class.exists?(:app_key => app_key)
  end
end
