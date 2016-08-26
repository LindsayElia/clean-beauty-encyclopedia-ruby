# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# clear any existing data from these tables:
Brand.destroy_all
Product.destroy_all
Ingredient.destroy_all

# data for Brand table
brand1 = Brand.create(
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

brand2 = Brand.create(
	name: "Indie Lee",
	site_url: "http://indielee.com/shop/all-products",
	hq_country: "United States",
	hq_region: "NY",
	hq_postal_code: "10590",
	year_founded: "2010",
	is_vegan: false,
	contains_vegan: true,
	is_gluten_free: false
	)

brand3 = Brand.create(
	name: "Ilia",
	site_url: "https://iliabeauty.com/collections/all",
	hq_country: "United States",
	hq_region: "CA",
	hq_postal_code: "--",
	year_founded: "2011",
	is_vegan: false,
	contains_vegan: true,
	is_gluten_free: false
	)

# data for Product table
product1 = Product.create(
	name: "Vitamin D",
	category: "skincare, wash",
	application_type: "face, liquid",
	price: 39.00,
	currency: "$",
	size: " 2 oz.",
    ingredientsGrouping: "aloe, alpine rose extract, glycerin, safflower oil, aqua, rice extract, mushroom extract, caprylic/capric triglyceride, rose extract, dehydroacetic acid, benzyl alcohol"
	)

product2 = Product.create(
	name: "Chia Whip",
	category: "skincare, moisturize",
	application_type: "face, cream",
	price: 32.00,
	currency: "$",
	size: " 5 FL OZ",
    ingredientsGrouping: "aloe, coco glucoside, caprylyl/capryl glucoside, xylitylglucoside, anhydroxylitol, xylitolorganic, lactic acid, chia seed supercritical extract, sorbitan caprylate (and) propanediol (and) benzoic acid, rose extract, vanilla planifolia fruit extract, cucumis sativus (cucumber) fruit extract, coffee seed extract, coconut fruit extract"
	)

product3 = Product.create(
	name: "Brightening Cleanser",
	category: "skincare, wash",
	application_type: "face, liquid",
	price: 32.00,
	currency: "$",
	size: "4oz",
	ingredientsGrouping: "Purified Water, Decyl Glucoside (Veg. Oils & Sugar), Disodium Coco-Glucoside Citrate, Coco Glucoside Oleaste (Coconut and Sunflower Oil), Hydrolyzed Wheat Protein*, Xanthan Gum, Fragaria Chiloensis Seed Oil (Strawberry), Lycopene, Phenoxyethanol, Ethylhexylglycerin"
	)

product4 = Product.create(
	name: "Squalane Facial Cream",
	category: "skincare, moisturize",
	application_type: "face, cream",
	price: 70.00,
	currency: "$",
	size: "1oz",
	ingredientsGrouping: "Aqua, Simmondsia Chinensis, Persea Gratissima, Aloe Barbadensis, Emulsifying Wax, Vegetable Glycerin, Elaeis Guineensis, Palm Stearic Acid, Squalane (olive derived), Hyaluronic Acid, Tocopheryl Acetate, Rosa Rubiginosa Seed Oil, Ascorbyl Palmitate, Dl-Panthenol, Allantoin, Xanthan Gum, Triticum Vulgare, Daucus Carota Oil, Rosmarinus Officinalis Leaf Extract, Phenoxyethanol"
	)

product5 = Product.create(
	name: "Tularosa F1",
	category: "makeup, face",
	application_type: "face, liquid",
	price: 44.00,
	currency: "$",
	size: "1.7oz",
	ingredientsGrouping: "water, glycerin, rosewater"
	)

product6 = Product.create(
	name: "Age Of Consent",
	category: "makeup, face",
	application_type: "face, powder",
	price: 28.00,
	currency: "$",
	size: ".5oz",
	ingredientsGrouping: "rosewater"
	)

# data for Ingredient table
ingredient1 = Ingredient.create(
	name: "water",
	alternate_names: "aqua",
	is_animal_derived: false,
	is_organic: false
	)

ingredient2 = Ingredient.create(
	name: "aloe",
	alternate_names: "Aloe Barbadensis",
	is_animal_derived: false,
	is_organic: false
	)

ingredient3 = Ingredient.create(
	name: "sugar",
	alternate_names: "--",
	is_animal_derived: false,
	is_organic: false
	)

ingredient4 = Ingredient.create(
	name: "Vegetable Glycerin",
	alternate_names: "glycerin",
	is_animal_derived: false,
	is_organic: false
	)

# Associate Brand and Product data
brand1.products << product1
brand1.products << product2

brand2.products << product3
brand2.products << product4

brand3.products << product5
brand3.products << product6

# Associate Product and Ingredient data
product1.ingredients << ingredient1
product1.ingredients << ingredient2
product1.ingredients << ingredient3

product2.ingredients << ingredient1
product2.ingredients << ingredient4

product3.ingredients << ingredient3



