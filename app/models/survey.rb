class Survey < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :age, :city, :email_same, :emergency_contact, :emergency_contact_phone, :emergency_contact_relationship, :equipment, :equipment_explained, :family_name, :first_name, :food_amount, :food_supply, :medical_training, :medical_training_explained, :primary_email, :primary_email, :primary_home, :primary_home, :primary_phone, :primary_phone, :secondary_email, :secondary_home, :secondary_phone, :skill, :skill_explained, :special_medical, :state, :tools, :tools_explained, :water_amount, :water_supply, :zip, :user_id
end
