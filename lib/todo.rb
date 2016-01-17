class TodoItem
  
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  
  def details
    format_description(@description).to_s + "due: " +
    format_date(date1: @due).to_s +
    format_priority(@priority).to_s
  end

end
