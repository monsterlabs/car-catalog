class SerieSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :brand_id,
             :enabled
end
