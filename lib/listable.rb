module Listable
  	
  	def format_description(description, index = 0)
		index < 9 ? "#{description}".ljust(50) : "#{description}".ljust(49)
	end

	def format_priority(priority)
	    value = " ⇧".colorize(:blue) if priority == "high"
	    value = " ⇨".colorize(:yellow) if priority == "medium"
	    value = " ⇩".colorize(:red) if priority == "low"
	    value = "" if !priority
	    return value
  	end

	def format_date(options={})
		date = options[:date1] ? options[:date1].strftime("%D") : 'N/A'
		date << " -- " + options[:date2].strftime("%D") if options[:date2]
		return date
	end

end
