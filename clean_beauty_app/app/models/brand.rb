class Brand < ActiveRecord::Base
	validates :name,
		presence: true

	validates :year_founded,
		numericality: true
end
