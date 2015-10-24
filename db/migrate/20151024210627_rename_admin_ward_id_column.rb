class RenameAdminWardIdColumn < ActiveRecord::Migration
  def change
    rename_column :twitter_accounts, :admin_ward_id, :neighbourhood_id
  end
end
