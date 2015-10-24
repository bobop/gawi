class SearchController < ApplicationController

  def index
    if params[:search].present?
      # location = params[:search][:location]
      admin_ward_id = params[:search][:admin_ward_id]
      category = params[:search][:category]
    end


    # @location_response = fetch_location_data(lat_to_use, long_to_use)
    # @neighbourhood_response = fetch_neighbourhood_data(@location_response["force"], @location_response["neighbourhood"])

    redirect_to info_path(crime: category, admin_ward: admin_ward_id)
    
  end

  protected
    # def fetch_location_data(lat, long)
    #   response = HTTParty.get("https://data.police.uk/api/locate-neighbourhood?q=#{lat},#{long}")
    #   return JSON.parse response.body
    # end

    # def fetch_neighbourhood_data(force, neighbourhood_code)
    #   response = HTTParty.get("https://data.police.uk/api/#{force}/#{neighbourhood_code}")
    #   return JSON.parse response.body
    # end
    
end