class ComparativeSerializer < ActiveModel::Serializer
  attributes :id,
             :comparedCar,
             :specification

  def comparedCar
    { id: object.comparedCar_id }
  end

  def specification
    { id: object.specification_id }
  end
end
