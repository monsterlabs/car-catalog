require 'houston'
module CarCatalog
  class ApnClient

    def initialize(device, alert, updated_section)
      @apn = Houston::Client.development
      @apn.certificate = File.read Rails.root.join("config/apple_push_notification.pem").to_s
      @device = device
      @alert = alert
      @updated_section = updated_section
    end

    def build_notification
      @notification = Houston::Notification.new(device: @device.token)
      @notification.alert = @alert
      @notification.badge = @device.badge
      @notification.sound = "sosumi.aiff"
      @notification.content_available = true
      @notification.custom_data = { updated_section: @updated_section, device_id: @device.id }
    end

    def push
      build_notification
      @apn.push(@notification)
    end
  end
end
