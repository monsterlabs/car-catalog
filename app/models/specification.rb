class Specification < ActiveRecord::Base
  belongs_to :car, class_name: "Car", inverse_of: :specifications
  belongs_to :specification_type, class_name: "SpecificationType", foreign_key: "specificationType_id", inverse_of: :specifications
  has_many :features, class_name: "Feature", inverse_of: :specification
  has_many :comparatives, class_name: "Comparative", inverse_of: :specification
end
