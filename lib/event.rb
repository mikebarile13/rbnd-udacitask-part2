class EventItem
  
  include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end
  
  def details(index)
    "Event: " + format_description(@description, index).to_s + "Event Dates: " + format_date(date1: @start_date, date2: @end_date).to_s
  end

  def type
    "event"
  end

end
