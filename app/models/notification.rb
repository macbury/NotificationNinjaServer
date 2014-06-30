class Notification
  include ActiveModel::Validations
  attr_accessor :title, :url, :message

  validates :title, :message, presence: true

  def initialize(attrs={})
    attrs.each do |key, value|
      self.call("#{key}=", value)
    end
  end
end
