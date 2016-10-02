class ProductsController < ApplicationController
	def index
		@products = Product.order("name").all
	end

	def show
		@product = Product.find(params[:id])
	end
end