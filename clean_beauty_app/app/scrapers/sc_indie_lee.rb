require 'nokogiri'
require 'rest-client'
require 'json'

# page with all the links to obtain
list_indie_lee = "http://indielee.com/shop/all-products"

# get the html for the whole page
list_body = Nokogiri::HTML(RestClient.get(list_indie_lee))   

product_links = []
# for each element that is of class .product-image, loop over
list_body.css(".product-image").each do |link|
	# get the href for the a tag
	link_url = link["href"]
	product_links.push(link_url)
end
# puts product_links
# puts product_links.length

product_details = []
product_links.each do |product_link|
	product_body = Nokogiri::HTML(RestClient.get(product_link))
	name = product_body.css(".product-name h1").text
	price_string = product_body.css("span .price").text
	price = price_string[1..-1]		# removes first character from string; removing dollar symbol
	size = product_body.css(".weight").text.chop	# chop remove last character from string
	image_url = product_body.css("#image")[0]["src"]
	image_alt = product_body.css("#image")[0]["alt"]
	ingredients_grouping = product_body.css(".product-ingredients .content").text.strip		# strip removes all extra spaces
	product_details.push(
		name: name,
		price: price,
		size: size,
		image_url: image_url,
		image_alt: image_alt,
		ingredients_grouping: ingredients_grouping
	)
end

readable_product_details = JSON.pretty_generate(product_details)

# print to console
puts readable_product_details

# # write to file
File.open("../../db/data_from_scraping/indie_lee.json", "w") do |f|
	f.write(readable_product_details)
end

