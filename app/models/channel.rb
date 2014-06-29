class Channel < ActiveRecord::Base
  belongs_to :account

  validates :name, presence: true
  validates :subscription_token, :push_token, presence: true, uniqueness: true
end
