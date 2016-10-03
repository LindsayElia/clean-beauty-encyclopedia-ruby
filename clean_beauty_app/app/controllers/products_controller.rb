class ProductsController < ApplicationController

	# has_scope :by_category_high_level
	# has_scope :by_category_mid_level
	# has_scope :by_category_low_level

	def index
		# @products = apply_scopes(Product).all.order("name")
		@products = Product.all.order("name")
	end

	def makeup
		@products = Product.makeup.order("name") # using scope method created in model
		render action: :index
	end

	def body_hair
		@products = Product.body_hair.order("name")
		render action: :index
	end

	def other
		@products = Product.other.order("name")
		render action: :index
	end

	def show
		@product = Product.find(params[:id])
	end


end