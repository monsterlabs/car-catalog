class ComparativeSerializer < ActiveModel::Serializer
  attributes :id,
             :comparedCar,
             :specification

  has_many :compared_features
  def comparedCar
    { id: object.comparedCar_id }
  end

  def specification
    { id: object.specification_id }
  end
end
