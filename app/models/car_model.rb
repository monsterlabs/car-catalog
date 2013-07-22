class CarModel < ActiveRecord::Base
  self.table_name = "carmodels"
  validates :name, :presence => true
  validates :enabled, inclusion: { in: [true, false] }, :presence => true
  belongs_to :serie, class_name: "Serie", inverse_of: :car_models
end
