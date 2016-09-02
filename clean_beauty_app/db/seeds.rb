# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# DELETE THESE ONCE EVERYTHING IS WORKING - THESE DELETE ALL OF THE DATA IN THE DB
# they'll only run on data that has not been associated with other tables,
# so need to reset db anyway
# Clear any existing data from these tables:
Brand.destroy_all
Product.destroy_all
Ingredient.destroy_all



# BRAND DATA #############################

brand_one_love_organics = Brand.create(
	name: "One Love Organics",
	site_url: "http://shop.oneloveorganics.com/",
	hq_country: "United States",
	hq_region: "GA",
	hq_postal_code: "31522",
	year_founded: "2008",
	is_vegan: false,
	contains_vegan: true,
	is_gluten_free: false
	)

brand_indie_lee = Brand.create(
	name: "Indie Lee",
	site_url: "http://indielee.com/shop/all-products",
	hq_country: "United States",
	hq_region: "NY",
	hq_postal_code: "10590",
	year_founded: "2010",
	contains_vegan: true
	)

brand_ilia = Brand.create(
	name: "Ilia",
	site_url: "https://iliabeauty.com/collections/all",
	hq_country: "United States",
	hq_region: "CA",
	year_founded: "2011",
	is_vegan: false,
	contains_vegan: true,
	is_gluten_free: true
	)


# PRODUCT DATA #############################

# read/import files containing data
data_one_love_organics = ActiveSupport::JSON.decode(File.read('db/data_from_scraping/one_love_organics.json'))
data_indie_lee = ActiveSupport::JSON.decode(File.read('db/data_from_scraping/indie_lee.json'))
data_ilia = ActiveSupport::JSON.decode(File.read('db/data_from_scraping/ilia.json'))


# create products

count_one_love_organics = 0
data_one_love_organics.each do |item|
	# using create! instead of create will tell us if there is a failure creating the record
	product_one_love_organics = Product.create!(
		name: item["name"],
		price: (item["price"]).to_f,	# convert string to float to retain decimal and be saved as a number data type
		currency: "USD",
		size: item["size"],
	    ingredients_grouping: item["ingredients_grouping"],
	    image_url: item["image_url"],
	    image_alt: item["image_alt"]
		)
	# puts (item["price"]).to_f
	brand_one_love_organics.products << product_one_love_organics		# associate product with brand
	count_one_love_organics = count_one_love_organics + 1
end
puts "count of one love items added to db:"
puts count_one_love_organics


count_indie_lee = 0
data_indie_lee.each do |item|
	product_indie_lee = Product.create!(
		name: item["name"],
		price: (item["price"]).to_f,
		currency: "USD",
		size: item["size"],
	    ingredients_grouping: item["ingredients_grouping"],
	    image_url: item["image_url"],
	    image_alt: item["image_alt"]
		)
	# puts (item["price"]).to_f
	brand_indie_lee.products << product_indie_lee		# associate product with brand
	count_indie_lee = count_indie_lee + 1
end
puts "count of indeie lee items added to db:"
puts count_indie_lee


count_ilia = 0
data_ilia.each do |item|
	product_ilia = Product.create!(
		name: item["name"],
		price: (item["price"]).to_f,
		currency: "USD",
		size: item["size"],
	    ingredients_grouping: item["ingredients_grouping"],
	    image_url: item["image_url"],
	    image_alt: item["image_alt"]
		)
	# puts (item["price"]).to_f
	brand_ilia.products << product_ilia		# associate product with brand
	count_ilia = count_ilia + 1
end
puts "count of ilia items added to db:"
puts count_ilia


# INGREDIENTS DATA #############################






# # data for Ingredient table
# ingredient1 = Ingredient.create(
# 	name: "water",
# 	alternate_names: "aqua",
# 	is_animal_derived: false,
# 	is_organic: false
# 	)

# ingredient2 = Ingredient.create(
# 	name: "aloe",
# 	alternate_names: "Aloe Barbadensis",
# 	is_animal_derived: false,
# 	is_organic: false
# 	)

# ingredient3 = Ingredient.create(
# 	name: "sugar",
# 	alternate_names: "--",
# 	is_animal_derived: false,
# 	is_organic: false
# 	)

# ingredient4 = Ingredient.create(
# 	name: "Vegetable Glycerin",
# 	alternate_names: "glycerin",
# 	is_animal_derived: false,
# 	is_organic: false
# 	)

# # Associate Brand and Product data
# brand1.products << product1
# brand1.products << product2

# brand2.products << product3
# brand2.products << product4

# brand3.products << product5
# brand3.products << product6

# # Associate Product and Ingredient data
# product1.ingredients << ingredient1
# product1.ingredients << ingredient2
# product1.ingredients << ingredient3

# product2.ingredients << ingredient1
# product2.ingredients << ingredient4

# product3.ingredients << ingredient3



