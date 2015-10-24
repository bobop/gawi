class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.string :twitter_handle
      t.string :admin_ward_id
    end
  end
end
