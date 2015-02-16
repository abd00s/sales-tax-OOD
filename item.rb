class Item
  def initialize(name, price, quantity, imported)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
  end

  def sub_total
    @price * @quantity
  end

  def import_duty
    if @imported 
      0.05
    else
      0
    end
  end

  def is_tax_exempt?
    @name =~ /book|pill|chocolate/
  end

  def sales_tax
    unless is_tax_exempt? 
      0.1 
    else
      0
    end
  end

  def grand_total
    sub_total + total_tax_amount
  end

  def total_tax_amount
    apply_sales_tax + apply_import_duty
  end
end

product = Item.new("potato", 25, 3, true)
puts product.sub_total
puts product.import_duty
puts product.is_tax_exempt? 
puts product.sales_tax
# puts product.grand_total
# puts product.total_tax_amount
