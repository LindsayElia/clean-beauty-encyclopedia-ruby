class ProductsController < ApplicationController

	has_scope :by_category_high_level
	has_scope :by_category_mid_level
	has_scope :by_category_low_level

	def index
		@products = apply_scopes(Product).all.order("name")
	end

	def show
		@product = Product.find(params[:id])
	end
end