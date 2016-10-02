class BrandsController < ApplicationController
	def index
		@brands = Brand.order("name").all
	end

	def show
		@brand = Brand.find(params[:id])
	end
end
