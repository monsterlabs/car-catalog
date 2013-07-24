class Feature < ActiveRecord::Base
  validates :highlighted, inclusion: { in: [true, false] }
  belongs_to :specification, inverse_of: :features
  has_many :compared_features, class_name: "ComparedFeature", inverse_of: :feature
end
