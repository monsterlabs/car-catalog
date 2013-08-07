class Comparative < ActiveRecord::Base
  belongs_to :compared_car, class_name: "ComparedCar", foreign_key: "comparedCar_id", inverse_of: :comparatives
  belongs_to :specification, inverse_of: :comparatives
  has_many :compared_features, class_name: "ComparedFeature", inverse_of: :comparative, dependent: :destroy
end
