class LineSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :serie_id,
             :enabled
end
