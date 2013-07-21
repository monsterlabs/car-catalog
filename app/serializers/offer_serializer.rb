class OfferSerializer < ActiveModel::Serializer
  include ActionDispatch::Routing::UrlFor
  include Rails.application.routes.url_helpers
  include ApplicationHelper

  attributes :id,
    :title,
    :body,
    :url,
    :validUntil,
    :enabled,
    :image,
    :imageUrl,
    :largeImage,
    :largeImageUrl

  def image
    object.image.file.filename
  end

  def largeImage
    object.largeImage.file.filename
  end

  def imageUrl
    root_url + object.image.url.to_s
  end

  def largeImageUrl
    root_url + object.largeImage.url.to_s
  end

  protected
  def root_url
    url_options[:protocol] + [url_options[:host], url_options[:port]].join(':') 
  end
end
