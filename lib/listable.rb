module Listable
  	
  	def format_description(description)
		"#{description}".ljust(30)
	end

	def format_date(options={})
		date = options[:date1].strftime("%D") if options[:date1]
		date << " -- " + options[:date2].strftime("%D") if options[:date2]
		date = 'N/A' unless options[:date1]
		return date
	end

end
