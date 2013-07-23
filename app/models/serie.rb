class Serie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :enabled, inclusion: { in: [true, false] }
  belongs_to :brand, inverse_of: :series
  has_many :car_lines, class_name: "CarLine", inverse_of: :serie, dependent: :destroy

  def active_model_serializer
    SerieSerializer
  end
end
