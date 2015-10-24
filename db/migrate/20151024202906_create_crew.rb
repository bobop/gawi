class CreateCrew < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :name
      t.string :skill
      t.text :blurb
      t.string :rate
    end
  end
end
