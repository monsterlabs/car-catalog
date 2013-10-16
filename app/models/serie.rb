class Serie < ActiveRecord::Base
  include Notificable

  validates :name, presence: true, uniqueness: true
  validates :enabled, inclusion: { in: [true, false] }
  belongs_to :brand, inverse_of: :series
  has_many :lines, class_name: "Line", inverse_of: :serie

  before_destroy :delete_lines

  def delete_lines
    lines.collect(&:delete_cars)
    Line.delete_all(serie_id: self.id)
  end

  def active_model_serializer
    SerieSerializer
  end
end
