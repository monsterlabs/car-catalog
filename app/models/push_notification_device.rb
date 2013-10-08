class PushNotificationDevice < ActiveRecord::Base
  validates :token, :presence => true, :uniqueness => true

  def active_model_serializer
    PushNotificationDeviceSerializer
  end
end
