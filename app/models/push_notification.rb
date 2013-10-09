class PushNotification < ActiveRecord::Base
  validates :title, :body, :presence => true
  default_scope order("created_at ASC")
  scope :sent, where(:status => true)
  scope :pending, where(:status => false)

  def to_s
    [title, body, ::I18n.l(created_at, :format => :long)].join(". ")
  end
end
