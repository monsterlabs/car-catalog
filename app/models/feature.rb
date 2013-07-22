class Feature < ActiveRecord::Base
  validates :name, :descr, presence: true
  validates :highlighted, inclusion: { in: [true, false] }
  belongs_to :specification, inverse_of: :features
end
