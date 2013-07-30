class FeatureSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :descr,
             :additionalInfo,
             :highlighted,
             :specification
  has_many :compared_features, key: 'comparedFeatures'

  def specification
    { id: object.specification_id }
  end
end
