desc "prints my name"
task :greet do
	puts "lindsaaaay"
end

desc "prints all brands' names"
task :show_brands => :environment do
	brands = Brand.all.order("name")
	brands.each do |brand|
		puts brand.name
	end
end
