class ComparedFeatureSerializer < ActiveModel::Serializer
  attributes :id,
             :descr,
             :comparative,
             :feature

  def comparative
    { id: object.comparative_id }
  end

  def feature
    { id: object.feature_id }
  end
end
