class Device < ActiveRecord::Base
  validates :system, :registration_id, presence: true, length: { minimum: 4 }
  before_create :ensure_have_unique_uid

  def ensure_have_unique_uid
    while true
      self.uid = SecureRandom.hex
      break if Device.where(uid: self.uid).size == 0
    end
  end
end
