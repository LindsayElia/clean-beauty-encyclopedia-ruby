class Product < ActiveRecord::Base

	validates :name,
		presence: true,
		uniqueness: true

	validates :price_float,
		numericality: true

	belongs_to :brand

	has_many :product_ingredients
	has_many :ingredients, through: :product_ingredients

	# http://blog.teamtreehouse.com/creating-vanity-urls-in-rails
	def slug
		name.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end

end
