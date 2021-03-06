class Product < ActiveRecord::Base

	validates :name,
		presence: true,
		uniqueness: true

	validates :price_float,
		numericality: true

	belongs_to :brand

	has_many :product_ingredients
	has_many :ingredients, -> { order 'ingredients.alternate_names, ingredients.name' }, through: :product_ingredients  
	# order by ingredient name when pulling out the associated data
	# Rails 4 uses this format of scope blocks, and must be second argument

	# for more readable urls
	# http://blog.teamtreehouse.com/creating-vanity-urls-in-rails
	def slug
		name.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end

	# filtering - use scopes
	scope :by_category_high_level, -> { where(:category_high_level => category_high_level) }
	scope :by_category_mid_level, -> { where(:category_mid_level => category_mid_level) }

	# format for passing in arguments
	#      method name				 	argument to pass in				column name				  argument we just defined on the left
	# scope :by_category_low_level, 	-> 	(category_low_level) 	{ where("category_low_level = ?", category_low_level) }

	scope :makeup, -> { where(category_high_level: "makeup") }
	scope :body_hair, -> { where("category_high_level = ? OR category_high_level = ?", "body_care", "hair_care") }
	scope :other, -> { where(category_high_level: "other") }


end
