class Brand < ActiveRecord::Base
	
	validates :name,
		presence: true,
		uniqueness: true

	validates :year_founded,
		numericality: true

	has_many :products

	# http://blog.teamtreehouse.com/creating-vanity-urls-in-rails
	def slug
		name.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end

end
