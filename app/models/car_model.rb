class CarModel < ActiveRecord::Base
  self.table_name = "carmodels"
  validates :name, :presence => true
  validates :enabled, inclusion: { in: [true, false] }, :presence => true

  belongs_to :serie, class_name: "Serie", inverse_of: :car_models
  has_many :cars, class_name: "Car", foreign_key: "carModel_id", inverse_of: :car_model, dependent: :destroy
end
