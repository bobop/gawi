class IndexController < ApplicationController
  include GetCategories

  def index
    get_categories
  end

end