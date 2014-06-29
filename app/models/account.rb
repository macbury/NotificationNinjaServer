class Account < ActiveRecord::Base
  validates :provider, :uid, :name, presence: true
  has_many  :channels, dependent: :destroy

  before_create :generate_session_token

  def self.auth_with_github(omniauth)
    account     = Account.find_or_initialize_by(provider: omniauth["provider"], uid: omniauth["uid"])
    account.name = omniauth["info"]["nickname"]
    account.save!
    account
  end

  def generate_session_token
    self.session_key = SecureRandom.hex(32)
  end

  def generate_session_token!
    generate_session_token
    self.save
    self.session_key
  end
end
