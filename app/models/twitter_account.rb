class TwitterAccount < ActiveRecord::Base
  has_many :admin_wards, foreign_key: :neighbourhood_code, primary_key: :neighbourhood_id

end