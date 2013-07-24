require File.join(Rails.root.to_s, 'lib/car_catalog/car_template_reader')
module CarCatalog
  class CarTemplateImporter
    def initialize(record)
      @record = record
      @template = CarCatalog::CarTemplateReader.new(record.xls.file.path)
    end

    def import_and_save
      if @template.valid?
        find_or_create_car
        find_or_create_compared_cars
        create_specification_and_features
        import_car_file_attributes({xls_errors: "", imported: true})
        true
      else
        import_car_file_attributes({xls_errors: @template.errors.join("\n"), imported: false})
        false
      end
    end

    private

    def import_car_file_attributes(attr)
      h = {serie: @template.serie_name, model: @template.car_modelName, year: @template.car_year, line: @template.car_line_name}
      @record.update_attributes(h.merge(attr))
    end

    def find_or_create_car
        @bmw_brand = Brand.where(name: "BMW").first_or_create
        @serie = Serie.where(name: @template.serie_name, brand_id: @bmw_brand.id).first_or_create
        @car_line = CarLine.where(name: @template.car_line_name, serie_id: @serie.id).first_or_create
        @car = Car.where(modelName: @template.car_modelName, year: @template.car_year, carLine_id: @car_line.id).first_or_create
        @car.update_attribute(:highlights, @template.car_highlights)
        @car.update_attribute(:image, File.open(@record.image.file.path))
    end

    def find_or_create_compared_cars
        @compared_cars = @template.compared_cars.collect do |h|
          @brand = Brand.where(name: h[:brand_name]).first_or_create
          @compared_car = ComparedCar.where(modelName: h[:modelName], year: @template.car_year, brand_id: @brand.id).first_or_create
        end
    end

    def create_specification_and_features
      @car.specifications.destroy_all
      @template.specification_and_features.each do |specification|
        @specification_type = SpecificationType.where(name: specification[:specification_type_name]).first_or_create
        @specification = Specification.where(car_id: @car.id, specificationType_id: @specification_type.id, descr: ".").first_or_create
        specification[:features].each do |f|
          create_comparatives(@specification.id)
          create_feature(f, @specification.id)
        end
      end
    end

    def create_comparatives(specification_id)
      @comparatives = @compared_cars.collect { |compared_car| Comparative.create(comparedCar_id: compared_car.id, specification_id: specification_id) }
    end

    def create_feature(attr, specification_id)
      compared_features = attr[:compared_features]
      attr.delete(:compared_features)
      attr.merge!(highlighted: attr[:highlighted] == '*')
      attr.merge!(specification_id: specification_id)
      @feature = Feature.create(attr)
      create_compared_features(compared_features, @feature.id)
    end

    def create_compared_features(compared_features, feature_id)
      @compared_cars.size.times do |i|
        @compared_feature = ComparedFeature.create(descr: compared_features[i], comparative_id: @comparatives[i], feature_id: feature_id)
      end
    end
  end
end
# @template_importer = CarCatalog::CarTemplateImporter.new(CarFile.first)
#@template_importer.import_and_save
