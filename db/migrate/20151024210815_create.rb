class Create < ActiveRecord::Migration
  def change
     create_table :comments do |t|
       t.text :blurb
       t.integer :admin_ward_id
       t.string :hood
       t.string :crime
       t.timestamps
     end
  end
end
