class TodoItem
  
  include Listable
  attr_reader :description, :due, :priority
  @@priorities = ["high", "medium", "low", nil]

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @@priorities.include?(options[:priority]) ? (@priority = options[:priority]) : (raise UdaciListErrors::InvalidPriorityValue, "'#{options[:priority]}' is an invalid prioritization.")
  end
  
  def details(index)
    "To Do: " +
    format_description(@description, index).to_s + "Due: " +
    format_date(date1: @due).to_s +
    format_priority(@priority).to_s
  end

  def type
    "todo"
  end

  def change_priority(priority)
    @@priorities.include?(priority) ? (@priority = priority) : (raise UdaciListErrors::InvalidPriorityValue, "'#{priority}' is an invalid prioritization.")
  end

end
