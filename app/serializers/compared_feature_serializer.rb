class ComparedFeatureSerializer < ActiveModel::Serializer
  attributes :id,
             :descr,
             :feature

  def feature
    { id: object.feature_id }
  end
end
