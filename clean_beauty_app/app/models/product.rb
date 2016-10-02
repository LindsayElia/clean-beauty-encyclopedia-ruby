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

	# http://blog.teamtreehouse.com/creating-vanity-urls-in-rails
	def slug
		name.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end

end
