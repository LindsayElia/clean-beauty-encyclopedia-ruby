# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# BRAND DATA #############################

# skip if brand exists in the database already, validating for a unique name


# THIS SHOULD BE Brand.findby... not Product.findby... ???
unless Product.find_by(name: "One Love Organics")
	brand_one_love_organics = Brand.create(
		name: "One Love Organics",
		site_url: "http://oneloveorganics.com/",
		logo: "http://oneloveorganics.com/wp-content/themes/olo_genesis/images/logo.png",
		hq_country: "United States",
		hq_region: "GA",
		hq_postal_code: "31522",
		year_founded: "2008",
		is_vegan: false,
		contains_vegan: true,
		is_gluten_free: false
		)
end

unless Product.find_by(name: "Indie Lee")
	brand_indie_lee = Brand.create(
		name: "Indie Lee",
		site_url: "http://indielee.com/",
		logo: "http://indielee.com/shop/skin/frontend/indielee/default/images/indie_logo.png",
		hq_country: "United States",
		hq_region: "NY",
		hq_postal_code: "10590",
		year_founded: "2010",
		contains_vegan: true
		)
end

unless Product.find_by(name: "Ilia")
	brand_ilia = Brand.create(
		name: "Ilia",
		site_url: "https://iliabeauty.com/",
		logo: "https://cdn.shopify.com/s/files/1/0127/2332/t/15/assets/logo.png?17685407568754088629",
		hq_country: "United States",
		hq_region: "CA",
		year_founded: "2011",
		is_vegan: false,
		contains_vegan: true,
		is_gluten_free: true
		)
end


# PRODUCT DATA #############################

# read/import files containing data
data_one_love_organics = ActiveSupport::JSON.decode(File.read('data_from_scraping/one_love_organics.json'))
data_indie_lee = ActiveSupport::JSON.decode(File.read('data_from_scraping/indie_lee.json'))
data_ilia = ActiveSupport::JSON.decode(File.read('db/data_from_scraping/ilia.json'))


# create products and ingredients, associate both
count_one_love_organics = 0
data_one_love_organics.each do |item|
	# skip item if product exists in the database already, validating for a unique name
	unless Product.find_by(name: item["name"])
		# using create! instead of create will tell us if there is a failure creating the record
		product_one_love_organics = Product.create!(
			name: item["name"],
			price_float: (item["price"]).to_f,
			price_string: item["price"],
			currency: "USD",
			size: item["size"],
		    ingredients_grouping: item["ingredients_grouping"],
		    image_url: item["image_url"],
		    image_alt: item["image_alt"],
		    original_url: item["original_url"]
			)
		brand_one_love_organics.products << product_one_love_organics		# associate product with brand
		count_one_love_organics = count_one_love_organics + 1

		ingredients_string = item["ingredients_grouping"]
		# puts ingredients_string
		ingredients_array = ingredients_string.split(/\s*,\s*/)
		# puts ingredients_array

		ingredients_array.each do |array_item|
			# look for ingredient in db, and create if it does not exist
			ingredient = Ingredient.find_or_create_by!(name: array_item)
			# associate ingredient & product
			ingredient.products << product_one_love_organics
		end

	end
end
puts "count of one love items added to db:"
puts count_one_love_organics


count_indie_lee = 0
data_indie_lee.each do |item|
	unless Product.find_by( name: item["name"])
		product_indie_lee = Product.create!(
			name: item["name"],
			price_float: (item["price"]).to_f,
			price_string: item["price"],
			currency: "USD",
			size: item["size"],
		    ingredients_grouping: item["ingredients_grouping"],
		    image_url: item["image_url"],
		    image_alt: item["image_alt"],
		    original_url: item["original_url"]
			)
		brand_indie_lee.products << product_indie_lee
		count_indie_lee = count_indie_lee + 1

		ingredients_string = item["ingredients_grouping"]
		# puts ingredients_string
		ingredients_array = ingredients_string.split(/\s*,\s*/)
		# puts ingredients_array

		ingredients_array.each do |array_item|
			# look for ingredient in db, and create if it does not exist
			ingredient = Ingredient.find_or_create_by!(name: array_item)
			# associate ingredient & product
			ingredient.products << product_indie_lee
		end

	end
end
puts "count of indie lee items added to db:"
puts count_indie_lee


count_ilia = 0
data_ilia.each do |item|
	unless Product.find_by( name: item["name"])
		product_ilia = Product.create!(
			name: item["name"],
			price_float: (item["price"]).to_f,
			price_string: item["price"],
			currency: "USD",
			size: item["size"],
		    ingredients_grouping: item["ingredients_grouping"],
		    image_url: item["image_url"],
		    image_alt: item["image_alt"],
		    original_url: item["original_url"]
			)
		brand_ilia.products << product_ilia
		count_ilia = count_ilia + 1

		ingredients_string = item["ingredients_grouping"]
		# puts ingredients_string
		ingredients_array = ingredients_string.split(/\s*,\s*/)
		# puts ingredients_array

		ingredients_array.each do |array_item|
			# look for ingredient in db, and create if it does not exist
			ingredient = Ingredient.find_or_create_by!(name: array_item)
			# associate ingredient & product
			ingredient.products << product_ilia
		end

	end
end
puts "count of ilia items added to db:"
puts count_ilia

