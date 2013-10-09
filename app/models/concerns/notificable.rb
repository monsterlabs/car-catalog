module Notificable
  extend ActiveSupport::Concern

  included do
    after_commit :enqueue_notification
  end

  def enqueue_notification
    PushNotification.create(title: ::I18n.t(".notificable.title"), body: ::I18n.t(".notificable.body"))
  end
end
