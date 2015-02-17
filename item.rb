class Item
  attr_reader :name, :price, :quantity, :imported
  def initialize(name, price, quantity, imported)
    @name = name
    @price = price * 100
    @quantity = quantity
    @imported = imported
  end

  def sub_total
    (@price * @quantity)/100
  end

  def import_duty
    if @imported 
      5
    else
      0
    end
  end

  def is_tax_exempt?
    if @name =~ /book|pill|chocolate/
      true
    else
      false
    end
  end

  def sales_tax
    unless is_tax_exempt? 
      10
    else
      0
    end
  end

  def calculate_sales_tax
    formatted_amount(sub_total * sales_tax)
  end

  def calculate_import_duty
    formatted_amount(sub_total * import_duty)
  end

  def total_tax_amount
    (calculate_sales_tax + calculate_import_duty)/100.0
  end

  def grand_total
    sub_total + total_tax_amount
  end

  def formatted_amount(number)
    return number if (number % 5) == 0
    (number + 5 - (number % 5))
  end
end


