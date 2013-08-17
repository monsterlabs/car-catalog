class Feature < ActiveRecord::Base

  validates :highlighted, inclusion: { in: [true, false] }

  belongs_to :specification, inverse_of: :features
  has_many :compared_features, class_name: "ComparedFeature", inverse_of: :feature

  after_validation :increment_sequence, on: [:create]

  default_scope order("features.sequence ASC")

  private
  def increment_sequence
    value = ActiveRecord::Migration::execute "SELECT nextval('features_sequence_seq')"
    self.sequence = value[0]["nextval"].to_i
  end
end
