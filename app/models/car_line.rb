class CarLine < ActiveRecord::Base
  self.table_name = "carlines"
  validates :name, :presence => true
  validates :enabled, inclusion: { in: [true, false] }, :presence => true

  belongs_to :serie, class_name: "Serie", inverse_of: :car_lines
  has_many :cars, class_name: "Car", foreign_key: "carLine_id", inverse_of: :car_line, dependent: :destroy

  def active_model_serializer
    CarLineSerializer
  end
end
