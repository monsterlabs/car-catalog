class PushNotificationDeviceSerializer < ActiveModel::Serializer
  attributes :token,
             :ip_address,
             :timezone,
             :badge
end
