class Brand < ActiveRecord::Base
	
	validates :name,
		presence: true

	validates :year_founded,
		numericality: true

	has_many :products

end
