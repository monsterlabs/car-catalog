require Rails.root.join('./lib/car_catalog/apn_client.rb').to_s
class PushNotification < ActiveRecord::Base
  validates :title, :body, :presence => true

  default_scope order("created_at ASC")
  scope :sent, where(:status => true)
  scope :pending, where(:status => false)

  after_create :push_device_notifications

  def to_s
    [title, body, ::I18n.l(created_at, :format => :long)].join(". ")
  end

  private
  def push_device_notifications
    PushNotificationDevice.all.each do |device|
      @apn_client = CarCatalog::ApnClient.new(device.token, self.to_s, device.badge.to_i + 1)
      @apn_client.push
    end
    update_attribute(:status,true)
  end
end
