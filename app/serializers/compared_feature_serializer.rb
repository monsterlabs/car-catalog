class ComparedFeatureSerializer < ActiveModel::Serializer
  attributes :id,
             :descr,
             :feature,
             :comparative

  def feature
    { id: object.feature_id }
  end

  def comparative
    { id: object.comparative_id }
  end

end
