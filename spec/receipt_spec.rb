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

  
end