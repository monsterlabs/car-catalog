class FeatureSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :descr,
             :additionalInfo,
             :highlighted,
             :specification

  def specification
    {id: object.specification_id }
  end
end
