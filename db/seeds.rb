# encoding: utf-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

User.destroy_all
@user = User.new(:email => 'admin@bmwapps.mx', :password => 'qw1234..', :password_confirmation => 'qw1234..', :is_admin => true)
# @user.avatar = File.open("#{Rails.root.to_s}/spec/factories/images/users/wildcard_avatar.png")
if @user.valid?
  @user.save
else
  puts @user.errors.full_messages.join(', ')
end

unless Rails.env.production?

  @offerImages = Dir.glob(File.join("#{Rails.root.to_s}/spec/factories/images/offers", "*[1-6].jpg"))
  @offerLargeImages = Dir.glob(File.join("#{Rails.root.to_s}/spec/factories/images/offers", "*large.jpg"))
  Offer.destroy_all
  (1..20).each do |i|
    @offer = Offer.new
    @offer.title = Faker::Lorem.sentence
    @offer.body = Faker::Lorem.paragraph
    @offer.validUntil = Date.today + i.month
    @offer.enabled = true
    @offer.url =  Faker::Internet.http_url
    @offer.image = File.open(@offerImages.sample)
    @offer.largeImage = File.open(@offerLargeImages.sample)
    unless @offer.valid?
      puts @offer.errors.full_messages.join(", ")
    else
      @offer.save
    end
  end

  Brand.destroy_all
  ["BMW", "Audi", "Volvo", "Mercedes Benz"].each do |name|
    @brand = Brand.new(name: name)
    puts @brand.errors.full_messages.join(', ') unless @brand.save
  end

  Serie.destroy_all
  @brand = Brand.where(name: 'BMW').first
  @series = ["Serie 1", "Serie 3", "Serie 4", "Serie 5", "Serie 6", "Serie 7", "Serie X", "Serie Z4", "Serie M"]
  @series.each do |name|
    @serie = Serie.new(name: name, enabled: true)
    @serie.brand = @brand
    puts @serie.errors.full_messages.join(', ') unless @serie.save
  end

  Line.destroy_all
  Serie.all.each do |serie|
    max = 3 
    rand(1..max).times do
      @line = Line.new(name: Faker::Product.model + ' ' + Faker::Lorem.words(rand(1..2)).join(' '), enabled: true)
      @line.serie = serie
      puts @line.errors.full_messages.join(', ') unless @line.save
    end
  end


  Car.destroy_all
  @images = Dir.glob(File.join("#{Rails.root.to_s}/spec/factories/images/cars", "*.jpg"))
  Line.all.each do |line|
    max = 3
    rand(1..max).times do
      @car = Car.new(modelName: Faker::Product.model + ' ' + Faker::Lorem.word, highlights: Faker::Lorem.paragraphs(rand(1..3)).join("\n"), enabled: true, year:2013)
      @car.line = line
      @car.image = File.open(@images.sample)
      puts @car.errors.full_messages.join(', ') unless @car.save
    end
  end

  SpecificationType.destroy_all
  ["Técnica", "Equipamiento", "Seguridad", "Opcionales", "Precio"].each do |name|
    @specification_type = SpecificationType.new(name: name)
    puts @specification_type.errors.full_messages.join(', ') unless @specification_type.save
  end

  Specification.destroy_all
  specification_types = SpecificationType.all
  Car.all.each do |car|
    specification_types.all.each do |specification_type|
      @specification = Specification.new(descr: Faker::Lorem.paragraph)
      @specification.specification_type = specification_type
      @specification.car = car
      puts @specification.errors.full_messages.join(', ') unless @specification.save
    end
  end

  [ComparedFeature, Comparative, ComparedCar, Feature].each do |klass_name|
    klass_name.destroy_all
  end
  @brands = Brand.where("name != 'BMW'").all
  Car.all.each do |car|

    @compared_cars = []
    max = 5 ||@brands.size
    rand(1..max).times do
      @compared_car = ComparedCar.new(modelName: Faker::Product.model + ' ' + Faker::Lorem.word, year: 2013)
      @compared_car.brand = @brands.sample
      if @compared_car.save
        @compared_cars.push @compared_car
      else
        puts @compared_car.errors.full_messages.join(', ')
      end
    end

    car.specifications.each do |specification|

      @compared_cars.each do |compared_car|
        @comparative = Comparative.new
        @comparative.specification = specification
        @comparative.compared_car = compared_car
        puts @comparative.errors.full_messages.join(', ') unless @comparative.save
      end

      max = rand(1..10)
      max.times do |i|
        @feature = Feature.new(name: 'Feature' + Faker::Lorem.words(rand(1..2)).join(' '), descr: Faker::Lorem.word, highlighted: (rand(2) == 1))
        @feature.specification = specification
        puts @feature.errors.full_messages.join(', ') unless @feature.save

        specification.comparatives.each do |comparative|
          @compared_feature = ComparedFeature.new(descr: Faker::Lorem.word)
          @compared_feature.feature = @feature
          @compared_feature.comparative = comparative
          puts @compared_feature.errors.full_messages.join(', ') unless @compared_feature.save
        end
      end
    end
  end
end

#rand(5..10).times do
#  @car_file = CarFile.new
#  @car_file.image = File.open(@images.sample)
#  @car_file.xls = File.open("#{Rails.root.to_s}/spec/factories/bmw-template.xlsx")
#  @car_file.serie = @series.sample
#  @car_file.year = 2013
#  @car_file.line = CarLine.all.sample.name
#  @car_file.model = Faker::Product.model + ' ' + Faker::Lorem.word
#  @car_file.imported = (rand(2) == 1)
#  @car_file.xls_errors = Faker::Lorem.paragraphs(3).join("\n") unless @car_file.imported?
#  puts @car_file.errors.full_messages.join(', ') unless @car_file.save
#  if @car_file.imported?
#    @car = Car.all.sample
#    @car.car_file = @car_file
#    @car.save
#  end
#end
