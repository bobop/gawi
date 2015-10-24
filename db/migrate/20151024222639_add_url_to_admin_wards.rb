class AddUrlToAdminWards < ActiveRecord::Migration
  def change
    add_column :admin_wards, :url, :string
    AdminWard.initialize_urls
  end
end
