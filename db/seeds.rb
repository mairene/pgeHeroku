# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parser = File.expand_path(File.dirname(File.dirname(__FILE__))) + "/db/CSVParser.rb"
require parser

file = File.expand_path(File.dirname(File.dirname(__FILE__))) + "/db/RawData.csv"

locations_hash = parse_file(file)
	p locations_hash
	locations_hash.each do |key,value|
		Summary.create(location: key, number_of_job_orders: value['job_orders_count'], job_orders_past_due: value['job_orders_past_due'])
	end
