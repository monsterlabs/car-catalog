module Notificable
  extend ActiveSupport::Concern

  included do
    if self == Car or self == Offer
      after_commit :enqueue_notification, on: [:create, :update, :destroy]
    elsif self != CarFile
      after_commit :enqueue_notification, on: [:update, :destroy]
    end
  end

  def enqueue_notification
      PushNotification.create(title: ::I18n.t(".notificable.title"), body: ::I18n.t(".notificable.body"), updated_section: self.class.name.downcase)
  end
end
