require File.join(Rails.root.to_s, 'lib/car_catalog/car_template_importer')
class CarFile < ActiveRecord::Base
  include Notificable

  validates :xls, :image, presence: true
  validates :imported, inclusion: { in: [true, false] }
  has_one :car, class_name: "Car", inverse_of: :car_file, dependent: :delete
  mount_uploader :image, ImageUploader
  mount_uploader :xls, DocumentUploader

  after_commit :import_xls, on: [:create, :update]

  def to_s
    [serie, line, model, year].join(' ')
  end

  def import_xls
    if self.new_record? or !self.imported?
      self.transaction do
        @importer = CarCatalog::CarTemplateImporter.new(self)
        @importer.import_and_save
      end
    end
  end
end
