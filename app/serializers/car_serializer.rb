class CarSerializer < ActiveModel::Serializer
  include ActionDispatch::Routing::UrlFor
  include Rails.application.routes.url_helpers
  include ApplicationHelper

  attributes :id,
    :modelName,
    :enabled,
    :highlights,
    :orderKey,
    :year,
    :line,
    :image,
    :imageUrl

  def image
    object.image.file.filename
  end

  def imageUrl
    root_url + object.image.url.to_s
  end

  def line
    { id: object.line_id }
  end
end
