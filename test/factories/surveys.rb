# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    family_name "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip 1
    primary_phone 1
    primary_home false
    secondary_phone 1
    secondary_home false
    primary_email "MyString"
    secondary_email "MyString"
    emergency_contact "MyString"
    emergency_contact_phone 1
    emergency_contact_relationship "MyString"
    food_supply false
    food_amount 1
    water_supply false
    water_amount 1
    first_name "MyString"
    age 1
    primary_phone 1
    primary_home false
    primary_email false
    email_same "MyString"
    special_medical "MyString"
    skill false
    skill "MyString"
    medical_training false
    medical_training_explained "MyString"
    equipment false
    equipment_explained "MyString"
    tools false
    tools_explained "MyString"
  end
end
