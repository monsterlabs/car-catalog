class SpecificationType < ActiveRecord::Base
  self.table_name = "specificationtypes"
  validates :name, presence: true, uniqueness: true
  has_many :specifications, class_name: "Specification", inverse_of: :specification_type
end
