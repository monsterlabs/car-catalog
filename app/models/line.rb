class Line < ActiveRecord::Base
  self.table_name = "lines"
  include Notificable

  validates :name, :presence => true
  validates :enabled, inclusion: { in: [true, false] }

  belongs_to :serie, class_name: "Serie", inverse_of: :lines
  has_many :cars, class_name: "Car", foreign_key: "line_id", inverse_of: :line, dependent: :delete_all

  def active_model_serializer
    LineSerializer
  end
end
