require 'nokogiri'
require 'rest-client'
require 'json'

# page with all the links to obtain
list_one_love_organics = "http://shop.oneloveorganics.com"

# get the html for the whole page
list_body = Nokogiri::HTML(RestClient.get(list_one_love_organics))   

product_links = []
# for each element that is of class .prod_box .p_img and a tag, loop over
list_body.css(".prod_box .p_img a").each do |link|
	# get the href for the a tag
	# prefix them with the site's main url to form a complete url
	link_url = list_one_love_organics + link["href"]
	product_links.push(link_url)
end
# puts product_links
# puts product_links.length

product_details = []
product_links.each do |product_link|
	product_body = Nokogiri::HTML(RestClient.get(product_link))
	name = product_body.css(".title").text.strip  	# strip removes all extra spaces
	price = product_body.css(".price").text.strip
	size = product_body.css(".prod_size span").text
	image_url_string = product_body.css(".main-image a img")[0]["src"]
	image_url = image_url_string[2..-1]			# Remove first two characters from string. Returns characters starting at index 2 until end.
	image_alt = product_body.css(".main-image a img")[0]["alt"]
	ingredients_grouping = product_body.css("#tab3").text.strip
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

# write to file
File.open("../../db/data_from_scraping/one_love_organics.json", "w") do |f|
	f.write(readable_product_details)
end

