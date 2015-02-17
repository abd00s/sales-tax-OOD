class Receipt
  attr_reader :items
  require "./parser"

  def initialize
    @items = []
  end

  def add_items(file)
    @items << parser_invoker(file)
  end

  def display_receipt
    
  end

  def self.run
    Receipt.new
  end

  def parser_invoker(file)
    parsed_products = Parser.new(file).products
  end
end

