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

  describe 'total_tax_amount' do
    it 'Returns 0 total tax for non-imported and exempt hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, false).total_tax_amount).to eq(0)
    end

    it 'Returns 15% total tax for imported and taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, true).total_tax_amount).to eq(25*3*0.05+25*3*0.1)
    end

    it 'Returns 10% total tax for non-imported and taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, false).total_tax_amount).to eq(25*3*0.1)
    end

    it 'Returns 5% total tax for imported and exempt hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, true).total_tax_amount).to eq(25*3*0.05)
    end
  end

  describe 'grand_total' do
    it 'Returns base price for non-imported and exempt hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, false).grand_total).to eq(25*3)
    end

    it 'Applies 15% total tax for imported and taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, true).grand_total).to eq(25*3*1.15)
    end

    it 'Applies 10% total tax for non-imported and taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, false).grand_total).to eq(25*3*1.1)
    end

    it 'Applies 5% total tax for imported and exempt hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, true).grand_total).to eq(25*3*1.05)
    end
  end
end