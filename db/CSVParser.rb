require 'csv'

def parse_file(file_location)
	job_order_count = {}
	job_orders_past_due {}
	CSV.foreach(file_location, :headers => true) do |row|
		location = row[1]
		if job_order_count.key?(location)
			job_order_count[:location] += 1
		else
			job_order_count[:location] = 1
		end
		if job_orders_past_due.key?(location)
			if row[3] == 1
				job_orders_past_due[:location] += 1
			end
		else
			if row[3] == 1
				job_orders_past_due[:location] = 1
			end
		end
	end
	locations_hash = {}
	job_orders_count.each do |k,v|
		locations_hash[:k] = {}
		locations_hash[:k][:job_orders_count] = v
	end
	job_orders_past_due.each do |k,v|
		locations_hash[:k][:job_orders_past_due] = v
	end
	return locations_hash
end