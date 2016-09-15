require 'nokogiri'
require 'rest-client'
require 'json'

# page with all the links to obtain - two pages
list_ilia_1 = "https://iliabeauty.com/collections/all"
list_ilia_2 = "https://iliabeauty.com/collections/all?page=2"
list_ilia_3 = "https://iliabeauty.com/collections/all?page=3"
domain_ilia = "https://iliabeauty.com"

# get the html for the whole page
list_body_1 = Nokogiri::HTML(RestClient.get(list_ilia_1))
list_body_2 = Nokogiri::HTML(RestClient.get(list_ilia_2))
list_body_3 = Nokogiri::HTML(RestClient.get(list_ilia_3))

product_links = []

all_lists = [list_body_1,list_body_2,list_body_3]
all_lists.each do |page|
	# for each element that is of class .thumbnail and an anchor element, loop over
	page.css(".thumbnail a").each do |link|
		# get the href for the a tag
		link_url = domain_ilia + link["href"]
		product_links.push(link_url)
	end
end

# puts product_links
# puts product_links.length


product_details = []
count = 0
product_links.each do |product_link|
	product_body = Nokogiri::HTML(RestClient.get(product_link))
	name = product_body.css(".product_name").text
	price_string = product_body.css("span .current_price").text.strip		# strip removes all extra spaces
	price = price_string[1..-1]		# removes first character from string; removing dollar symbol

	# children gives us all children elements of the .description class element
	# nokogiri gives me an array, with twice as many items in the array as elements I see on the page
	# I want the 3rd from the last element out of the children
	# so I'm using -6 which will give me the 6th from the last item in the array that nokogiri returns
	size_element = product_body.css(".description").children[-6]
	# some of the items do not have a size, so the child element will not exist, aka be 'nil'
	if size_element.nil?
		size = "N/A"
	else
		size = size_element.text
	end

	image_url_string = product_body.css(".featured_image")[0]["src"]
	image_url = image_url_string[2..-1]
	image_alt = product_body.css(".featured_image")[0]["alt"]

	# ingredients list is in the last child element of .description, in a <li> inside of a <ul>
	# using .text gets us the innermost text and using .strip takes off a line of empty spacing
	# so that we don't have to try to get a li after getting .children
	ingredients_grouping = product_body.css(".description").children[-2].text.strip

	product_details.push(
		name: name,
		price: price,
		size: size,
		image_url: image_url,
		image_alt: image_alt,
		ingredients_grouping: ingredients_grouping
	)

	count = count + 1

end
puts "COUNT: "
puts count

readable_product_details = JSON.pretty_generate(product_details)

# print to console
puts readable_product_details

# # # write to file
File.open("../../db/data_from_scraping/ilia.json", "w") do |f|
	f.write(readable_product_details)
end

