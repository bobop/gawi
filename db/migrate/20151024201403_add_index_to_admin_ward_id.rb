class AddIndexToAdminWardId < ActiveRecord::Migration
  def change
    add_index :twitter_accounts, :admin_ward_id
  end
end
