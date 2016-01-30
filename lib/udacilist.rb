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
    index <= (@items.length) && index > 0 ? @items.delete_at(index - 1) : (raise UdaciListErrors::IndexExceedsListSize, "Provided index '#{index}' out of list bounds")
  end
  
  def all
    puts "-" * @title.length
    sweet_title = Artii::Base.new :font => 'big'
    puts sweet_title.asciify(@title).colorize(:light_blue)
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details(position)}"
    end 
  end

  def filter(type)
    type = type.downcase
    case type
      when "todo"
        filtered_items = @items.select{|item| item.type == type}
        return_filter(filtered_items)
      when "event"
        filtered_items = @items.select{|item| item.type == type}
        return_filter(filtered_items)
      when "link"
        filtered_items = @items.select{|item| item.type == type}
        return_filter(filtered_items)
      else 
        raise UdaciListErrors::InvalidItemType, "Item type '#{type}' not supported"
    end
  end

  def return_filter(list)
    puts "-" * @title.length
    sweet_title = Artii::Base.new :font => 'big'
    puts sweet_title.asciify(@title).colorize(:light_blue)
    puts "-" * @title.length
    list.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details(position)}"
    end 
  end

  def change_priority(index, priority = "low")
    index_minus = index - 1
    type = @items[index_minus].type
    raise UdaciListErrors::InvalidItemType, "Must be a 'todo' item" if type != "todo"
    index <= (@items.length) && index > 0 ? @items[index_minus].change_priority(priority) : (raise UdaciListErrors::IndexExceedsListSize, "Provided index '#{index}' out of list bounds")
  end

  def add_dailies
    @items.push TodoItem.new("Go for run", due: "today", priority: "medium")
    @items.push TodoItem.new("Meditate", due: "today", priority: "medium")
    @items.push TodoItem.new("Programming Training", due: "today", priority: "medium")
  end

end
