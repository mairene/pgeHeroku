parser = File.expand_path(File.dirname(File.dirname(__FILE__))) + "/db/CSVParser.rb"
require parser

file = File.expand_path(File.dirname(File.dirname(__FILE__))) + "/db/RawData.csv"

# namespace :SummaryData do
# 	task :populate => :environment do
		locations_hash = parse_file(file)

		locations_hash.each do |key,value|
			Summary.create(location: key, number_of_job_orders: value[:job_orders_count], job_orders_past_due: value[:job_orders_past_due])
		end
# 	end
# end