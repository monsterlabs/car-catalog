require 'houston'
module CarCatalog
  class ApnClient

    def initialize(device_token, alert, badge)
      @apn = Houston::Client.development
      @apn.certificate = File.read Rails.root.join("config/apple_push_notification.pem").to_s
      @device_token = device_token
      @alert = alert
      @badge = badge
    end

    def build_notification
      @notification = Houston::Notification.new(device: @device_token)
      @notification.alert = @alert
      @notification.badge = @badge
      @notification.sound = "sosumi.aiff"
      @notification.content_available = true
      # @notification.custom_data = {foo: "bar"}
    end

    def push
      build_notification
      @apn.push(@notification)
    end
  end
end
