class SpecificationSerializer < ActiveModel::Serializer
  attributes :id,
             :car,
             :specificationType,
             :descr
  def car
    { id: object.car_id }
  end

  def specificationType
    { id: object.specificationType_id }
  end
end
