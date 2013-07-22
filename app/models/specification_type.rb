class SpecificationType < ActiveRecord::Base
  self.table_name = "specificationtypes"
  validates :name, :presence => true, :uniqueness => true
end
