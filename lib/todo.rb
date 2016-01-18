class TodoItem
  
  include Listable, UdaciListErrors
  attr_reader :description, :due, :priority
  @@priorities = ["high", "medium", "low", nil]

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @@priorities.include?(options[:priority]) ? (@priority = options[:priority]) : (raise InvalidPriorityValue, "'#{options[:priority]}' is an invalid prioritization.")
  end
  
  def details
    format_description(@description).to_s + "due: " +
    format_date(date1: @due).to_s +
    format_priority(@priority).to_s
  end

end
