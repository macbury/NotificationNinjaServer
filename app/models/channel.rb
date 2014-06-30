class Channel < ActiveRecord::Base
  belongs_to :account

  validates :name, presence: true
  validates :subscription_token, :push_token, presence: true, uniqueness: true

  before_validation :generate_tokens

  def generate_tokens
    self.subscription_token ||= SecureRandom.urlsafe_base64(15)
    self.push_token         ||= SecureRandom.urlsafe_base64(15)
  end
end
