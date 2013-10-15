class Serie < ActiveRecord::Base
  include Notificable

  validates :name, presence: true, uniqueness: true
  validates :enabled, inclusion: { in: [true, false] }
  belongs_to :brand, inverse_of: :series
  has_many :lines, class_name: "Line", inverse_of: :serie, dependent: :delete_all

  def active_model_serializer
    SerieSerializer
  end
end
