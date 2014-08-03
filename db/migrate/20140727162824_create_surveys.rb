class CreateSurveys < ActiveRecord::Migration
  def change

    create_table :surveys do |t|
      t.string :family_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :primary_phone
      t.boolean :primary_home
      t.integer :secondary_phone
      t.boolean :secondary_home
      t.string :primary_email
      t.string :secondary_email
      t.string :emergency_contact
      t.integer :emergency_contact_phone
      t.string :emergency_contact_relationship
      t.boolean :food_supply
      t.integer :food_amount
      t.boolean :water_supply
      t.integer :water_amount
      t.string :first_name
      t.integer :age
      t.integer :primary_phone
      t.boolean :primary_home
      t.boolean :primary_email
      t.string :email_same
      t.string :special_medical
      t.boolean :skill
      t.string :skill_explained
      t.boolean :medical_training
      t.string :medical_training_explained
      t.boolean :equipment
      t.string :equipment_explained
      t.boolean :tools
      t.string :tools_explained
      t.integer :user_id

      t.timestamps
    end
  end
end
