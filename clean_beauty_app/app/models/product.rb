class Product < ActiveRecord::Base

	validates :name,
		presence: true,
		uniqueness: true

	validates :price,
		numericality: true

	belongs_to :brand

	has_many :product_ingredient
	has_many :ingredients, through: :product_ingredient

end
