class Ingredient < ActiveRecord::Base

	validates :name,
		presence: true,
		uniqueness: true

	has_many :product_ingredients
	has_many :products, through: :product_ingredients

end
