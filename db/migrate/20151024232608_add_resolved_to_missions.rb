class AddResolvedToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :resolved, :boolean, default: false
  end
end
