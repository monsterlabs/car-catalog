class Line < ActiveRecord::Base
  self.table_name = "lines"
  include Notificable

  validates :name, :presence => true
  validates :enabled, inclusion: { in: [true, false] }

  belongs_to :serie, class_name: "Serie", inverse_of: :lines
  has_many :cars, class_name: "Car", foreign_key: "line_id", inverse_of: :line

  before_destroy :destroy_cars
  
  def destroy_cars
    cars.each do |c|
      c.destroy_specifications
    end
    cars.delete_all
  end

  def active_model_serializer
    LineSerializer
  end
end
