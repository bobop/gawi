class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :crime_id
      t.integer :month
      t.integer :year
      t.string :date_string
      t.text :reported_by
      t.text :falls_within
      t.float :longitude
      t.float :latitude
      t.text :location
      t.text :lsoa_code
      t.text :lsoa_name
      t.text :crime_type
      t.text :outcome_type
      t.text :context
      t.timestamps
    end
  end
end
