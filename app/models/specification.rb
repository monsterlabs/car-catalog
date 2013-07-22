class Specification < ActiveRecord::Base
  belongs_to :car, class_name: "Car", inverse_of: :specifications
  belongs_to :specification_type, class_name: "SpecificationType", foreign_key: "specificationType_id", inverse_of: :specifications
end
