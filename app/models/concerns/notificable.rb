module Notificable
  extend ActiveSupport::Concern

  included do

    if self == CarFile or self  == Offer
      after_commit :enqueue_notification
    else
      after_update :enqueue_notification
    end

  end

  def enqueue_notification
    PushNotification.create(title: ::I18n.t(".notificable.title"), body: ::I18n.t(".notificable.body"), updated_section: self.class.name.downcase)
  end
end
