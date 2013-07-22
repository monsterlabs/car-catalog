class ComparedFeature < ActiveRecord::Base
  self.table_name = "comparedfeatures"
  belongs_to :comparative, inverse_of: :compared_features
  belongs_to :feature, inverse_of: :compared_features
end
