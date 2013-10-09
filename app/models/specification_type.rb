class SpecificationType < ActiveRecord::Base
  include Notificable

  self.table_name = "specificationtypes"
  validates :name, presence: true, uniqueness: true
  has_many :specifications, class_name: "Specification", foreign_key: "specificationType_id", inverse_of: :specification_type
end
