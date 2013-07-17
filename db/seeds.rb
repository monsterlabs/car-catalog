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
  @offer.body = Faker::Lorem.sentence
  @offer.validUntil = Date.today + i.month
  @offer.enabled = true
  @offer.url =  Faker::Internet.http_url
  @offer.image = File.open("#{Rails.root.to_s}/spec/factories/images/bmw_offer_test_#{i}.jpg")
  @offer.largeImage = File.open("#{Rails.root.to_s}/spec/factories/images/bmw_offer_test_#{i}_large.jpg")
  unless @offer.valid?
    puts @offer.errors.full_messages.join(", ")
  else
    @offer.save
  end
end

User.destroy_all
@user = User.new(:email => 'admin@bmw.com.mx', :password => 'qw1234..', :password_confirmation => 'qw1234..', :is_admin => true)
if @user.valid?
  @user.save
else
  puts @user.errors.full_messages.join(', ')
end

