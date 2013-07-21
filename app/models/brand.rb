class Brand < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :series, class_name: "Serie", inverse_of: :brand
end
