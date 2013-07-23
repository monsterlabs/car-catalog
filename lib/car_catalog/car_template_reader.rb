# encoding: utf-8
require 'roo'
module CarCatalog
  class CarTemplateReader
    def initialize(file)
      @s = Roo::Excelx.new(file)
      @errors = []
    end

    def serie_name
      name = @s.cell('B',3).split('/').first
      name = "Serie #{name}" if name !~ /^Serie/i
      name
    end

    def car_modelName
      @s.cell('B', 1)

    end

    def car_year
      @s.cell('B', 2).to_i
    end

    def car_highlights
      @s.cell('B', 5)
    end

    def car_line_name
      @s.cell('B', 4).split('/').first
    end

    def compared_cars
      (6..@s.last_column).collect do |col|
        brand = @s.cell(7, col)
        modelName = @s.cell(8, col)
        {brand_name: brand, compared_car_modelName: modelName, compared_car_year: car_year}
      end
    end

    def specification_types
      (9..@s.last_row).collect { |row|
        specification_type = @s.cell(row, 1)
        specification_type.to_s.strip unless specification_type.to_s.strip.empty?
      }.compact
    end

    def features
      specification_types.each do |spec_type|
        puts spec_type
        @features = []
        active_section = false
        (9..@s.last_row).collect do |row|
          specification_type = @s.cell(row, 1).to_s.strip
          if active_section == true
            @features.push({highlighted: @s.cell(row, 2), name: @s.cell(row, 3), descr: @s.cell(row,4) })
          end

          if !specification_type.empty? and specification_type == spec_type
            active_section = true
          end
          if !specification_type.empty? and specification_type != spec_type
            active_section = false
          end
        end
        puts @features
      end

    end

    def valid?
      valid_specification_types = ['Técnica', 'Equipamiento', 'Seguridad', 'Precio', 'Líneas']
      unless valid_specification_types == specification_types
        @errors.push("Debe incluir las ficha técnica con los siguientes nombres de sección: #{valid_specification_types.join(', ')}")
      end
      @errors.count == 0
    end

    def debug
      puts "Serie: #{serie_name}"
      puts "Car line: #{car_line_name}"
      puts "Car model: #{car_modelName}"
      puts "Car year: #{car_year}"
      puts "Car highlights:\n#{car_highlights}"
      puts "Compared cars:\n"
      puts compared_cars
      #puts "Specification types:\n"
      #puts specification_types
      puts "Features:\n"
      features
    end


  end
end
@xls = CarCatalog::CarTemplateReader.new("spec/factories/bmw-template.xlsx")
@xls.debug
