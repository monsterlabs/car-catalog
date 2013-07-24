# encoding: utf-8
require 'roo'
require 'json'
module CarCatalog
  class CarTemplateReader
    attr_reader :errors
    def initialize(file)
      @s = Roo::Excelx.new(file)
      @errors = []
    end

    def serie_name
      name = @s.cell('B',3).to_s
      name = "Serie #{name}" unless name =~ /^Serie/i or name.empty?
      name
    end

    def car_modelName
      @s.cell('B', 1)
    end

    def car_year
      @s.cell('B', 2).to_i
    end

    def car_highlights
      @s.cell('B', 5).to_s
    end

    def car_line_name
      @s.cell('B', 4).to_s
    end

    def compared_cars
      (6..@s.last_column).collect do |col|
        brand = @s.cell(7, col).to_s
        modelName = @s.cell(8, col).to_s
        unless brand.to_s.empty? or modelName.to_s.empty?
          {brand_name: brand, modelName: modelName, car_year: car_year}
        end
      end
    end

    def specification_types
      (9..@s.last_row).collect { |row|
        specification_type = @s.cell(row, 1)
        specification_type.to_s.strip unless specification_type.to_s.strip.empty?
      }.compact
    end

    def specification_and_features
      max_columns = 6 + (compared_cars.size  - 1)
      specification_types.collect do |spec_type|
        @features = []
        active_section = false
        (9..@s.last_row).collect do |row|
          specification_type = @s.cell(row, 1).to_s.strip
          @features.push feature_by_row(row) if active_section
          active_section = true if !specification_type.empty? and specification_type == spec_type
          active_section = false if !specification_type.empty? and specification_type != spec_type
        end
        {:specification_type_name => spec_type, :features => @features}
      end
    end

    def feature_by_row(row)
        max_columns = 6 + (compared_cars.size  - 1)
        compared_features = (6..max_columns).collect { |col| @s.cell(row, col).to_s }
        { highlighted: @s.cell(row, 2).to_s, name: @s.cell(row, 3).to_s,
          additionalInfo: @s.cell(row, 4).to_s, descr: @s.cell(row,5).to_s,
          compared_features: compared_features
        }
    end

    def valid?
      validate_sections
      validate_specifications
      validate_compared_cars
      @errors.count == 0
    end

    def validate_sections
      @errors.push("Debe incluir el modelo del auto") if car_modelName.empty?
      @errors.push("Debe incluir el año del auto") if car_year == 0
      @errors.push("Debe incluir el texto de la portada del auto") if car_highlights.empty?
      @errors.push("Debe incluir el nombre de la serie del auto")  if serie_name.empty?
      @errors.push("Debe incluir el nombre de la línea del auto")  if car_line_name.empty?
    end

    def validate_compared_cars
      compared_cars.each do |h|
        @errors.push("Debe incluir la marca del auto comparado") if h[:brand_name].to_s.empty?
        @errors.push("Debe incluir el modelo del auto comparado") if h[:brand_name].to_s.empty?
      end
    end

    def validate_specifications
      valid_specification_types = ['Técnica', 'Equipamiento', 'Seguridad', 'Precio', 'Líneas']
      unless valid_specification_types == specification_types
        @errors.push("Debe incluir las características con los siguientes nombres de sección: #{valid_specification_types.join(', ')}")
      end
    end

    def debug
      puts "=" * 80
      puts "Serie: #{serie_name}"
      puts "Car line: #{car_line_name}"
      puts "Car model: #{car_modelName}"
      puts "Car year: #{car_year}"
      puts "Car highlights:\n#{car_highlights}"
      puts "=" * 80
      puts "Compared cars:\n"
      puts JSON.pretty_generate(compared_cars)
      puts "=" * 80
      puts "Specification types:\n"
      puts specification_types
      puts "=" * 80
      puts "Specification, Features and Compared features:\n"
      puts JSON.pretty_generate(specification_and_features)
    end
  end
end
