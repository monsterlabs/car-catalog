class ComparedCar < ActiveRecord::Base
  self.table_name = "comparedcars"
  validates :modelName, :year, :presence => true
  belongs_to :brand, inverse_of: :compared_cars
end