class Mission < ActiveRecord::Base
  after_save :set_date_stuff
  
  private
  
  def set_date_stuff
    if self.date_string.present?
      arr = self.date_string.split('-')
      self.update_columns(month: arr[1], year: arr[0])
    end
  end
end