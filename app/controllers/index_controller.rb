class IndexController < ApplicationController
  include GetCategories

  def index
    get_categories
  end

  def show
    get_categories
    @crime = @crime_categories.select{ |c| c[1] == params[:crime] }.first[0]
    @admin_ward = AdminWard.find_by(url: params[:admin_ward])
    
    # NEIGHBOURHOOD
    @neighbourhood_response = HTTParty.get("https://data.police.uk/api/greater-manchester/#{@admin_ward.neighbourhood_code}")
    @neighbourhood = JSON.parse(@neighbourhood_response.body)
    @neighbourhood_mash = Hashie::Mash.new @neighbourhood

    @lat = @neighbourhood_mash.centre.latitude rescue "53.472225"
    @long = @neighbourhood_mash.centre.longitude rescue "-2.2936317"
    
    @crew = Crew.all.sample(4)
    @comments = Comment.where(crime: params[:crime], admin_ward_id: @admin_ward.id)

    @this_percentage = calculate_percentage(@admin_ward, params[:crime])
    @score_band = score_band(@this_percentage)

    # FIND NEARBY WARDS
    nw_array = []
    nearby_wards = AdminWard.near([@admin_ward.lat, @admin_ward.lng], 20).limit(6)
    nearby_wards.each do |nw|
      nw_array << { name: nw.name, percentage: calculate_percentage(nw, params[:crime]) }
    end
    logger.info "--- nw_array = #{nw_array.inspect}"
    @recommended = nw_array.select{ |a| a[:percentage] < @this_percentage }
    @not_recommended = nw_array.select{ |a| a[:percentage] > @this_percentage }
    calculate_recommended_crime
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

      return (@resolved_crimes.to_f/@all_crimes.to_f ) * 100.0
    end

    def score_band(perc)
      return perc.round(-1) / 10
    end

    def calculate_recommended_crime
      current_best = @crime
      current_best_score = @this_percentage
      @crime_categories.each do |crime|
        unless crime[1] == "anti-social-behaviour"
          temp = calculate_percentage(@admin_ward, crime[1])
          if temp < current_best_score
            current_best_score = temp
            current_best = crime
          end
        end
      end
      @recommended_crime = current_best[0]
    end

end