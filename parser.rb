class Parser
  require './item'
  attr_reader :products
  def initialize(file)
    @products = []
    @file = file
    split_input
  end

  def split_input
    File.open("input/#{@file}") do |file|
      @items = file.map { |line| line.strip }
      inspect_line_items
    end
  end

  def inspect_line_items
    @items.each do |line_item|
      extract_item_details(line_item)
    end
  end

  def extract_item_details(item)
    quantity = item.match(/\d+/).to_s.to_i
    import = if item.match(/import/) 
      true 
    else 
      false
    end
    price = item.match(/(\d*)(.)(\d+)$/).to_s.to_f
    name = item.match(/\d+(.*)at/m)[1].strip
    create_item(name, price, quantity, import)
  end

  def create_item(name, price, quantity, import)
    @product = Item.new(name, price, quantity, import)
    @products << @product
  end
end

