class AddCrimeIndexToMissions < ActiveRecord::Migration
  def change
    change_column :missions, :crime_type, :string
    add_index :missions, :crime_type
  end
end
