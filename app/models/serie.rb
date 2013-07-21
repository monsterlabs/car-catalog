class Serie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :enabled, inclusion: { in: [true, false] }
  belongs_to :brand, inverse_of: :series
end
