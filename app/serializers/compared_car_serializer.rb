class ComparedCarSerializer < ActiveModel::Serializer
  include ActionDispatch::Routing::UrlFor
  include Rails.application.routes.url_helpers
  include ApplicationHelper

  attributes :id,
             :modelName,
             :year,
             :image,
             :imageUrl,
             :brand

  def image
    object.image.file.filename unless object.image.nil? or object.image.file.nil?
  end

  def imageUrl
    root_url + object.image.url.to_s unless object.image.nil? or object.image.url.nil?
  end

  def brand
    { id: object.brand_id }
  end
end
