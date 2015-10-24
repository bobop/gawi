class IndexController < ApplicationController
  include GetCategories

  def index
    get_categories
  end

  def show
    get_categories
    @crime = @crime_categories.select{ |c| c[1] == params[:crime] }.first[0]
    
    # NEIGHBOURHOOD
    @neighbourhood_response = HTTParty.get("https://data.police.uk/api/greater-manchester/#{params[:neighbourhood]}")
    @neighbourhood = JSON.parse(@neighbourhood_response.body)
    
    # WIKI INTRO
    # @wiki_response = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=#{@neighbourhood['name']}")
    # @wiki_info = JSON.parse(@wiki_response.body)
    
    @wiki_response = nil
    @wiki_info = nil
    
    @local_bacon = JSON.parse(HTTParty.get("https://data.police.uk/api/greater-manchester/#{params[:neighbourhood]}/people").body)

  end

end