namespace :update_db do

	# read/import files containing data
	desc "print contents of file(s) in db/date_from_scraping folder"
	task :open_file, [:file_1] do |task, args|	#railsguide examples show multiple args but I'm only using 1 for now
		arg_1 = args.file_1
		file_contents = ActiveSupport::JSON.decode(File.read("db/data_from_scraping/#{arg_1}")) #this is the path down from the root directory
		puts file_contents
	end

	desc "open file(s) from db/data_brand_info and insert brand data into db"
	task :add_brand, [:file_1] => :environment do |task, args|
		arg_1 = args.file_1
		brand_data = ActiveSupport::JSON.decode(File.read("db/data_brand_info/#{arg_1}"))
		puts brand_data

		# json files contain an array of items, so we iterate through each item in the file
		brand_data.each do |brand_item|
			# skip if brand exists in the database already, validating for a unique name
			unless Brand.find_by(name: "IliaTEST")
				# assign to a variable to make associations later
				# single_brand = 
				Brand.create!(
					name: brand_item["name"],
					site_url: brand_item["site_url"],
					logo: brand_item["logo"],
					hq_country: brand_item["hq_country"],
					hq_region: brand_item["hq_region"],
					year_founded: brand_item["year_founded"],
					is_vegan: brand_item["is_vegan"],
					contains_vegan: brand_item["contains_vegan"],
					is_gluten_free: brand_item["is_gluten_free"]
					)
			end
		end

	end

end