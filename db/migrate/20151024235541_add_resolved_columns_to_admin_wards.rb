class AddResolvedColumnsToAdminWards < ActiveRecord::Migration
  def change
    add_column :admin_wards, :all_crime_resolved, :integer, default: 0
    add_column :admin_wards, :anti_social_behaviour_resolved, :integer, default: 0
    add_column :admin_wards, :bicycle_theft_resolved, :integer, default: 0
    add_column :admin_wards, :burglary_resolved, :integer, default: 0
    add_column :admin_wards, :criminal_damage_arson_resolved, :integer, default: 0
    add_column :admin_wards, :drugs_resolved, :integer, default: 0
    add_column :admin_wards, :other_theft_resolved, :integer, default: 0
    add_column :admin_wards, :possession_of_weapons_resolved, :integer, default: 0
    add_column :admin_wards, :public_order_resolved, :integer, default: 0
    add_column :admin_wards, :robbery_resolved, :integer, default: 0
    add_column :admin_wards, :shoplifting_resolved, :integer, default: 0
    add_column :admin_wards, :theft_from_the_person_resolved, :integer, default: 0
    add_column :admin_wards, :vehicle_crime_resolved, :integer, default: 0
    add_column :admin_wards, :violent_crime_resolved, :integer, default: 0
    add_column :admin_wards, :other_crime_resolved, :integer, default: 0

    add_index :missions, [:crime_type, :resolved]
  end
end
