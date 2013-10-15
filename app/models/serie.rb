class Serie < ActiveRecord::Base
  include Notificable

  validates :name, presence: true, uniqueness: true
  validates :enabled, inclusion: { in: [true, false] }
  belongs_to :brand, inverse_of: :series
  has_many :lines, class_name: "Line", inverse_of: :serie

  before_destroy :destroy_lines

  def destroy_lines
    lines.each do |l|
      l.destroy_cars
    end
    lines.delete_all
  end

  def active_model_serializer
    SerieSerializer
  end
end
