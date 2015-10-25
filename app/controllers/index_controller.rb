class IndexController < ApplicationController
  include GetCategories

  def index
    get_categories
  end

  def show
    get_categories
    @crime_data = @crime_categories.select{ |c| c[1] == params[:crime] }.first
    @crime = @crime_data[0]
    @admin_ward = AdminWard.find_by(url: params[:admin_ward])
    @arr = [1,2,3,4,5,6]
    # NEIGHBOURHOOD
    @neighbourhood_response = HTTParty.get("https://data.police.uk/api/greater-manchester/#{@admin_ward.neighbourhood_code}")
    @neighbourhood = JSON.parse(@neighbourhood_response.body)
    @neighbourhood_mash = Hashie::Mash.new @neighbourhood

    @lat = @neighbourhood_mash.centre.latitude rescue "53.472225"
    @long = @neighbourhood_mash.centre.longitude rescue "-2.2936317"
    
    # CREW
    @crew = Crew.all.sample(4)
    @comments = Comment.where(crime: params[:crime], admin_ward_id: @admin_ward.id)

    # SCORE
    @this_percentage = calculate_percentage(@admin_ward, params[:crime])
    @score_band = score_band(@this_percentage)

    # RECOMMENDATIONS
    nw_array = []
    nearby_wards = AdminWard.near([@admin_ward.lat, @admin_ward.lng], 20).limit(6)
    nearby_wards.each do |nw|
      nw_array << { name: nw.name, percentage: calculate_percentage(nw, params[:crime]), url: nw.url }
    end
    # logger.info "--- nw_array = #{nw_array.inspect}"
    @recommended = nw_array.select{ |a| a[:percentage] < @this_percentage }
    @not_recommended = nw_array.select{ |a| a[:percentage] > @this_percentage }
    calculate_recommended_crime

    # TWITTER
    @twitter_handle = TwitterAccount.find_by(neighbourhood_id: @neighbourhood['id']).twitter_handle
    logger.info "--- @twitter_handle = #{@twitter_handle.inspect}"
  end
  
  def create
    if params[:comment].present? &&  params[:comment][:blurb].present?
      admin_ward_id = AdminWard.find_by(url: params[:admin_ward]).id
      Comment.create(
       blurb: params[:comment][:blurb],
       hood: params[:neighbourhood],
       admin_ward_id: admin_ward_id,
       crime: params[:crime]
      )
      flash[:notice] = "Comment added"
    else
      flash[:notice] = "You are a dickhead.You did not put any text in the Comment field. You should think twice before reproducing!"
    end
    redirect_to info_path(admin_ward: params[:admin_ward], crime: params[:crime], neighbourhood: params[:neighbourhood], anchor: "gazeeb0")
  end

  protected
    def calculate_percentage(aw, crime)
      crime_slug = crime.gsub("-", "_")

      @resolved_crimes = aw[crime_slug+'_resolved']
      @all_crimes = aw[crime_slug]

      return 100 - ((@resolved_crimes.to_f/@all_crimes.to_f ) * 100.0)
    end

    def score_band(perc)
      return perc.round(-1) / 10
    end

    def calculate_recommended_crime
      current_best = @crime_data
      current_best_score = @this_percentage
      (@crime_categories - current_best).each do |crime|
        unless crime[1] == "anti-social-behaviour"
          temp = calculate_percentage(@admin_ward, crime[1])
          if temp > current_best_score
            current_best_score = temp
            current_best = crime
          end
        end
      end
      @recommended_crime = current_best
    end

end