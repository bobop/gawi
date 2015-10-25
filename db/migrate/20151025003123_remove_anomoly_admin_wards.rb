class RemoveAnomolyAdminWards < ActiveRecord::Migration
  def change
    AdminWard.where(name: ['Haydock', 'Culcheth', 'Rixton and Woolston', 'High Legh', 'Handforth', 'Billinge and Seneley Green', 'Healey and Whitworth']).delete_all
  end
end
