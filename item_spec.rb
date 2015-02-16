require 'rspec'
require './item'

RSpec.describe Item do

  describe 'is_tax_exempt?' do
    it 'Returns false for taxable hard-coded input' do
      expect(Item.new("potato", 25, 3, true).is_tax_exempt?).to eq(false)
    end

    it 'Returns true for taxable hard-coded input' do
      expect(Item.new("Toy story books", 25, 3, true).is_tax_exempt?).to eq(true)
    end
  end
end