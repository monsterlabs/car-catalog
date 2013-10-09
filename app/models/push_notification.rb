require Rails.root.join('./lib/car_catalog/apn_client.rb').to_s
class PushNotification < ActiveRecord::Base
  validates :title, :body, :updated_section, :presence => true

  default_scope order("created_at ASC")
  scope :sent, where(:status => true)
  scope :pending, where(:status => false)

  after_create :push_device_notifications

  def to_s
    # [title, body, ::I18n.l(created_at, :format => :long)].join(". ")
    [title, body].join(". ")
  end

  private
  def push_device_notifications
    PushNotificationDevice.all.each do |device|
      device.update_attribute(:badge, device.badge+1)
      @apn_client = CarCatalog::ApnClient.new(device, self.to_s, updated_section)
      @apn_client.push
    end
    update_attribute(:status,true)
  end
end
