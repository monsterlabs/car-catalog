class SerieSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :brand,
             :enabled
  def brand
    { id: object.brand_id }
  end
end
