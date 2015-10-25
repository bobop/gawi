class AdminWard < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng

  has_many :comments
  has_one :twitter_account, foreign_key: :neighbourhood_id, primary_key: :neighbourhood_code

  acts_as_url :name
end
