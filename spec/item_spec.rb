require 'rspec'
require './item'

RSpec.describe Item do

  describe 'sub_total' do
    it 'Calculates subtotal for hard-coded input' do
      expect(Item.new("potato", 25, 3, true).sub_total).to eq(25*3)
    end
  end

  describe 'import_duty' do
    it 'Return 5% tax for imported hard-coded input' do
      expect(Item.new("potato", 25, 3, true).import_duty).to eq(0.05)
    end

    it 'Return 0% tax for non-imported hard-coded input' do
      expect(Item.new("potato", 25, 3, false).import_duty).to eq(0)
    end
  end

  describe 'is_tax_exempt?' do
    it 'Returns false for taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, true).is_tax_exempt?).to eq(false)
    end

    it 'Returns true for taxable hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, true).is_tax_exempt?).to eq(true)
    end
  end

  describe 'sales_tax' do
    it 'Returns 10% sales tax for taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, true).sales_tax).to eq(0.1)
    end

    it 'Returns 0% sales tax for exempt hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, true).sales_tax).to eq(0)
    end
  end

  describe 'calculate_sales_tax' do
    it 'Calculates 10% tax for taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, true).calculate_sales_tax).to eq(7.5)
    end

    it 'Returns 0 sales tax for exempt hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, true).calculate_sales_tax).to eq(0)
    end
  end

  describe 'calculate_import_duty' do
    it 'Calculates 5% duty for imported hard-coded input' do
      expect(Item.new("potato", 25, 3, true).calculate_import_duty).to eq(25*3*0.05)
    end

    it 'Returns 0 import duty for non-imported hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, false).calculate_import_duty).to eq(0)
    end
  end
end