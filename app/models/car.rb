class Car < ActiveRecord::Base
  include Notificable

  validates :modelName, :highlights, :year, :image, :presence => true
  validates :enabled, inclusion: { in: [true, false] }

  belongs_to :line, class_name: "Line", foreign_key: "line_id", inverse_of: :cars
  belongs_to :car_file, class_name: "CarFile", inverse_of: :car
  has_many :specifications, class_name: "Specification", inverse_of: :car

  before_destroy :destroy_specifications
  
  def destroy_specifications
    # Don't use the destroy method to avoid duplicated Push Notification
    specifications.each do |s|
      s.features.delete_all
      s.comparatives.each do |c|
        c.compared_features.delete_all
      end
      s.comparatives.delete_all
    end
    specifications.delete_all
  end


  mount_uploader :image, ImageUploader

  def to_s
    [serie_name, line_name, modelName, year].compact.join(' - ')
  end

  def line_name
    line.name unless line.nil?
  end

  def serie_name
    line.serie.name if !line.nil? and !line.serie.nil?
  end

  def active_model_serializer
    CarSerializer
  end

end
