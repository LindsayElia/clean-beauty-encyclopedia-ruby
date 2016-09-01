# require 'nokogiri'
# require 'rest-client'
# require 'json'
require 'bigdecimal'

# # detail_url = "https://iliabeauty.com/collections/all/products/balmy-days"
# # detail_url = "https://iliabeauty.com/collections/all/products/rebel-rebel"
# detail_url = "https://iliabeauty.com/collections/all/products/concealer-brush"
# product_body = Nokogiri::HTML(RestClient.get(detail_url))

# image_url_string = product_body.css(".featured_image")[0]["src"]
# image_url = image_url_string[2..-1]
# image_alt = product_body.css(".featured_image")[0]["alt"]

# ingredients_grouping = product_body.css(".description").children[-2].text.strip

# size_el = product_body.css(".description").children[-6]

# if size_el.nil?
# 	size = "N/A"
# else
# 	size = size_el.text
# end


# puts image_url
# puts image_alt
# puts ingredients_grouping
# puts size


string = "49.02"
# my_num = BigDecimal.new(string)
result = string.to_f
puts result