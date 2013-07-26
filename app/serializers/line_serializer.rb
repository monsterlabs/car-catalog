class LineSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :serie,
             :enabled
  def serie
    { id: object.serie.id }
  end
end
