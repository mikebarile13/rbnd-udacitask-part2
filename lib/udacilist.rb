class UdaciList

  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  
  def add(type, description, options={})
    type = type.downcase
    case type
      when "todo"
        @items.push TodoItem.new(description, options)
      when "event"
        @items.push EventItem.new(description, options)
      when "link"
        @items.push LinkItem.new(description, options)
      else 
        raise UdaciListErrors::InvalidItemType, "Item type '#{type}' not supported"
    end
  end
  
  def delete(index)
    index <= (@items.length - 1) || index < 0 ? @items.delete_at(index - 1) : (raise UdaciListErrors::IndexExceedsListSize, "Provided index '#{index}' out of list bounds")
  end
  
  def all
    puts "-" * @title.length
    sweet_title = Artii::Base.new :font => 'big'
    puts sweet_title.asciify(@title).colorize(:light_blue)
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end 
  end

end
