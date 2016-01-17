module Listable
  	
  	def format_description(description)
		"#{description}".ljust(30)
	end

	def format_priority(priority)
	    value = " ⇧" if priority == "high"
	    value = " ⇨" if priority == "medium"
	    value = " ⇩" if priority == "low"
	    value = "" if !priority
	    return value
  	end

	def format_date(options={})
		date = options[:date1] ? options[:date1].strftime("%D") : 'N/A'
		date << " -- " + options[:date2].strftime("%D") if options[:date2]
		return date
	end

end
