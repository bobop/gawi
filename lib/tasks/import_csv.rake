task import_csv: :environment do 
  source_path = Rails.root.join('lib', 'csv')
  files_count = 0
  Dir.glob("#{source_path}/*.csv").each do |csv_file|
    files_count += 1
    puts csv_file
    lines_count = 0
    CSV.foreach("#{csv_file}", headers: true) do |row|
      line = row.to_hash
        if Mission.create(
        crime_id: line['Crime ID'],
        date_string: line['Month'],
        reported_by: line['Reported by'],
        falls_within: line['Falls within'],
        longitude: line['Longitude'].to_f,
        latitude: line['Latitude'].to_f,
        location: line['Location'],
        lsoa_code: line['LSOA code'],
        lsoa_name: line['LSOA name'],
        crime_type: line['Crime type'],
        outcome_type: line['Last outcome category'].present? ? line['Last outcome category'] : line['Outcome type']
      )
        lines_count += 1
        puts "file: #{files_count} line: #{lines_count}"
      else
        puts "error with: #{line['Crime ID']}"
      end
    end
  end
end