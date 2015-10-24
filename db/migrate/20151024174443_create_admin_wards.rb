class CreateAdminWards < ActiveRecord::Migration
  def change
    create_table :admin_wards do |t|
      t.string :name
      t.string :lsoa_code, index: true
      t.string :neighbourhood_code
      t.float :lat
      t.float :lng
      t.integer :all_crime, default: 0
      t.integer :anti_social_behaviour, default: 0
      t.integer :bicycle_theft, default: 0
      t.integer :burglary, default: 0
      t.integer :criminal_damage_arson, default: 0
      t.integer :drugs, default: 0
      t.integer :other_theft, default: 0
      t.integer :possession_of_weapons, default: 0
      t.integer :public_order, default: 0
      t.integer :robbery, default: 0
      t.integer :shoplifting, default: 0
      t.integer :theft_from_the_person, default: 0
      t.integer :vehicle_crime, default: 0
      t.integer :violent_crime, default: 0
      t.integer :other_crime, default: 0

      t.timestamps null: false
    end
  end
end
