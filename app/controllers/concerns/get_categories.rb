module GetCategories
  extend ActiveSupport::Concern

  def get_categories
    @crime_categories_response = HTTParty.get('https://data.police.uk/api/crime-categories')
    @crime_categories = JSON.parse(@crime_categories_response.body).map{ |c| [c['name'], c['url']] }
  end
end