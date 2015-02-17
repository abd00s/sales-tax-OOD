class Receipt
  attr_reader :items
  require "./parser"
  require "./item"

  def initialize
    @items = []
    @sales_taxes = 0
    @total = 0
  end

  def add_items(file)
    parser_invoker(file).each {|item| @items << item}
  end

  def display_receipt
    @items.each do |item|
      puts "#{item.quantity} #{item.name}: #{item.price}"
    end
    puts "Sales Taxes: " + calculate_sales_taxes
    puts "Total: " + calculate_total
  end

  def calculate_sales_taxes
    @items.each do |item|
      @sales_taxes += item.total_tax_amount
    end
    @sales_taxes.to_s    
  end

  def calculate_total
    @items.each do |item|
      @total += item.grand_total
    end
    @total.to_s    
  end

  def self.run
    Receipt.new
  end

  def parser_invoker(file)
    parsed_products = Parser.new(file).products
  end
end

rec = Receipt.run
rec.add_items("input3.txt")
rec.display_receipt