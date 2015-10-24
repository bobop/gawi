task get_lsoa_wards: :environment do
  # LOOP THROUGH DISTINCT LSOA CODES
  lsoa_codes = Mission.select(:lsoa_code).distinct
  puts "--- lsoa_codes = #{lsoa_codes.count}"
  lsoa_codes.each_with_index do |lc,i|
    puts "--- i = #{i}, lc = #{lc.inspect}"
    # LOOKUP ADMIN WARD FROM FIRST LATLNG
    lsoa_crimes = Mission.where(lsoa_code: lc.lsoa_code)
    # puts "--- lsoa_crimes = #{lsoa_crimes.count}"
    # puts "--- lsoa_crimes.first = #{lsoa_crimes.first.inspect}"
    # https://api.postcodes.io/postcodes?lon=-2.42916&lat=53.5749
    pc_url = "https://api.postcodes.io/postcodes?lon=#{lsoa_crimes.first.longitude}&lat=#{lsoa_crimes.first.latitude}"
    # puts "--- pc_url = #{pc_url}"
    begin
      pc_response = HTTParty.get(pc_url)
    rescue
      next
    end
    # STORE admin_ward AGAINST LSOA_CODE
    pc_data = JSON.parse(pc_response.body)
    # puts "--- pc_data = #{pc_data.inspect}"

    if pc_data['result'].present?
      admin_ward = AdminWard.find_or_initialize_by(name: pc_data['result'].first['admin_ward'])
      admin_ward.lsoa_code = lc.lsoa_code
      admin_ward.lat = pc_data['result'].first['latitude']
      admin_ward.lng = pc_data['result'].first['longitude']
      admin_ward.all_crime += lsoa_crimes.count
      admin_ward.anti_social_behaviour += lsoa_crimes.where(crime_type: 'Anti-social behaviour').count
      admin_ward.bicycle_theft += lsoa_crimes.where(crime_type: 'Bicycle theft').count
      admin_ward.burglary += lsoa_crimes.where(crime_type: 'Burglary').count
      admin_ward.criminal_damage_arson += lsoa_crimes.where(crime_type: 'Criminal damage and arson').count
      admin_ward.drugs += lsoa_crimes.where(crime_type: 'Drugs').count
      admin_ward.other_theft += lsoa_crimes.where(crime_type: 'Other theft').count
      admin_ward.possession_of_weapons += lsoa_crimes.where(crime_type: 'Possession of weapons').count
      admin_ward.public_order += lsoa_crimes.where(crime_type: 'Public order').count
      admin_ward.robbery += lsoa_crimes.where(crime_type: 'Robbery').count
      admin_ward.shoplifting += lsoa_crimes.where(crime_type: 'Shoplifting').count
      admin_ward.theft_from_the_person += lsoa_crimes.where(crime_type: 'Bicycle theft').count
      admin_ward.vehicle_crime += lsoa_crimes.where(crime_type: 'Theft from the person').count
      admin_ward.violent_crime += lsoa_crimes.where(crime_type: 'Violence and sexual offences').count
      admin_ward.other_crime += lsoa_crimes.where(crime_type: 'Other crime').count
      admin_ward.save
    end
  end
end

task map_neighbourhoods_to_admin_wards: :environment do
  AdminWard.all.each do |aw|
    puts "--- aw = #{aw.inspect}"
    n_url = "https://data.police.uk/api/locate-neighbourhood?q=#{aw.lat},#{aw.lng}"
    begin
      n_response = HTTParty.get(n_url)
    rescue
      next
    end
    n_data = JSON.parse(n_response.body)
    aw.neighbourhood_code = n_data['neighbourhood']
    aw.save
  end
end

# admin_ward MODEL WITH lsoa_code, neighbourhood_code, lat, lng
# ASSOCIATION BETWEEN admin_ward AND missions