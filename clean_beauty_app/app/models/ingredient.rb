class Ingredient < ActiveRecord::Base

	validates :name,
		presence: true,
		uniqueness: true

	has_many :product_ingredient
	has_many :products, through: :product_ingredient

end
