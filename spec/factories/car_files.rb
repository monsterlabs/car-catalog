# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car_file do
    serie "MyString"
    line "MyString"
    model "MyString"
    year "MyString"
    xls "MyString"
    image "MyString"
    is_imported false
  end
end
