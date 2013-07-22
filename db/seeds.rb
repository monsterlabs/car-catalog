# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

Offer.destroy_all
(1..6).each do |i|
  @offer = Offer.new
  @offer.title = Faker::Lorem.sentence
  @offer.body = Faker::Lorem.paragraph
  @offer.validUntil = Date.today + i.month
  @offer.enabled = true
  @offer.url =  Faker::Internet.http_url
  @offer.image = File.open("#{Rails.root.to_s}/spec/factories/images/offers/bmw_offer_test_#{i}.jpg")
  @offer.largeImage = File.open("#{Rails.root.to_s}/spec/factories/images/offers/bmw_offer_test_#{i}_large.jpg")
  unless @offer.valid?
    puts @offer.errors.full_messages.join(", ")
  else
    @offer.save
  end
end

User.destroy_all
@user = User.new(:email => 'admin@bmwapps.mx', :password => 'qw1234..', :password_confirmation => 'qw1234..', :is_admin => true)
if @user.valid?
  @user.save
else
  puts @user.errors.full_messages.join(', ')
end

Brand.destroy_all
["BMW", "Audi", "Volvo", "Mercedes Benz"].each do |name|
  @brand = Brand.new(name: name)
  puts @brand.errors.full_messages.join(', ') unless @brand.save
end

Serie.destroy_all
@brand = Brand.where(name: 'BMW').first
["Serie 1", "Serie 3", "Serie 4", "Serie 5", "Serie 6", "Serie 7", "Serie X", "Serie Z4", "Serie M"].each do |name|
  @serie = Serie.new(name: name, enabled: true)
  @serie.brand = @brand
  puts @serie.errors.full_messages.join(', ') unless @serie.save
end

CarModel.destroy_all
Serie.all.each do |serie|
  rand(1..8).times do
    @car_model = CarModel.new(name: Faker::Product.model + ' ' + Faker::Lorem.words(rand(1..2)).join(' '), enabled: true)
    @car_model.serie = serie
    puts @car_model.errors.full_messages.join(', ') unless @car_model.save
  end
end


Car.destroy_all
images = Dir.glob(File.join("#{Rails.root.to_s}/spec/factories/images/cars", "*.jpg"))
CarModel.all.each do |car_model|
  rand(1..5).times do
    @car = Car.new(modelName: Faker::Product.model + ' ' + Faker::Lorem.word, highlights: Faker::Lorem.paragraphs(rand(1..3)).join("\n"), enabled: true, year:2013)
    @car.car_model = car_model
    @car.image = File.open(images[rand(images.size - 1)])
    puts @car.errors.full_messages.join(', ') unless @car.save
  end
end
