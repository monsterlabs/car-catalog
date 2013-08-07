class FeatureSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :descr,
             :additionalInfo,
             :highlighted
end
