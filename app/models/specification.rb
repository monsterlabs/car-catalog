class Specification < ActiveRecord::Base
  belongs_to :car, class_name: "Car", inverse_of: :specifications
  belongs_to :specification_type, class_name: "SpecificationType", foreign_key: "specificationType_id", inverse_of: :specifications
  has_many :features, class_name: "Feature", inverse_of: :specification, dependent: :delete_all
  has_many :comparatives, class_name: "Comparative", inverse_of: :specification, dependent: :delete_all

  def to_s
    [specification_type.name, car.to_s].join(': ')
  end
end
