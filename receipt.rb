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
      puts "#{item.quantity} #{item.name}: #{prettier_number(item.grand_total)}"
    end
    puts "Sales Taxes: " + prettier_number(calculate_sales_taxes)
    puts "Total: " + prettier_number(calculate_total)
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

  def prettier_number(number) 
    sprintf("%.2f", number)
  end

  def parser_invoker(file)
    parsed_products = Parser.new(file).products
  end

  def self.run
    Receipt.new
  end
end

