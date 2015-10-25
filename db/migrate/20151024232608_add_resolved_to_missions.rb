class AddResolvedToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :resolved, :boolean, default: 0
  end
end
