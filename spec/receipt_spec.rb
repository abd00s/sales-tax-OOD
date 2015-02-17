require 'rspec'
require './receipt'

RSpec.describe Receipt do
  let(:test1) { "input1.txt"}
  let(:test2) { "input2.txt"}
  let(:test3) { "input3.txt"}
  let(:shopping_cart) {Receipt.run}

  describe 'add_items' do
    it 'Adds items to the @items Array' do
      expect(shopping_cart.add_items(test1).class).to eq(Array)
    end

    it 'Adds instantiated Item objects to the Array' do
      expect(shopping_cart.add_items(test1)[0].class).to eq(Item)
    end
  end

  describe 'calculate_sales_taxes' do
    it 'Updates @sales_taxes to reflect added items' do
      shopping_cart.add_items(test1)
      expect(shopping_cart.calculate_sales_taxes).to eq("1.5")
    end
  end

  describe 'calculate_total' do
    it 'Updates @total to reflect added items' do
      shopping_cart.add_items(test1)
      expect(shopping_cart.calculate_total).to eq("29.830000000000005")
    end
  end

  describe 'display_receipt' do
    it 'TEST1 Outputs the line items, total tax and total amount in the desired format' do
      shopping_cart.add_items(test1)
      expect(shopping_cart.display_receipt).to eq("1 book: 12.49\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 29.83")
    end

    it 'TEST2 Outputs the line items, total tax and total amount in the desired format' do
      shopping_cart.add_items(test2)
      expect(shopping_cart.display_receipt).to eq("1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15")
    end

    it 'TEST3 Outputs the line items, total tax and total amount in the desired format' do
      shopping_cart.add_items(test3)
      expect(shopping_cart.display_receipt).to eq("1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n1 imported box of chocolates: 11.85\nSales Taxes: 6.70\nTotal: 74.68")
    end
  end

  
end