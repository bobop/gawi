class IndexController < ApplicationController
  include GetCategories

  def index
    get_categories
  end

  def show
    get_categories
    logger.info "--- @crime_categories = #{@crime_categories.inspect}"
    @crime = @crime_categories.select{ |c| c[1] == params[:crime] }.first[0]
    logger.info "--- @crime = #{@crime.inspect}"

    
  end

end