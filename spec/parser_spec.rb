require 'rspec'
require './parser'

RSpec.describe Parser do
  let(:file) { "test.txt"}
  let(:parser) {Parser.new(file)}

  describe 'initialize' do
    it 'Parses the input file and creates Item objects' do
      expect(parser.products.class).to eq(Array)
    end
  end

  describe 'extract_item_details' do
    it 'Extracts details of parsed input and instantiates product with attributes' do
      expect(parser.extract_item_details("1 book at 12.49")[0].name).to eq("book")
      expect(parser.extract_item_details("1 book at 12.49")[0].price).to eq(12.49*100)
      expect(parser.extract_item_details("1 book at 12.49")[0].quantity).to eq(1)
      expect(parser.extract_item_details("1 book at 12.49")[0].imported).to eq(false)

      expect(parser.extract_item_details("1 music CD at 14.99")[1].name).to eq("music CD")
      expect(parser.extract_item_details("1 music CD at 14.99")[1].price).to eq(14.99*100)
      expect(parser.extract_item_details("1 music CD at 14.99")[1].quantity).to eq(1)
      expect(parser.extract_item_details("1 music CD at 14.99")[1].imported).to eq(false)

      expect(parser.extract_item_details("1 chocolate bar at 0.85")[2].name).to eq("chocolate bar")
      expect(parser.extract_item_details("1 chocolate bar at 0.85")[2].price).to eq(0.85*100)
      expect(parser.extract_item_details("1 chocolate bar at 0.85")[2].quantity).to eq(1)
      expect(parser.extract_item_details("1 chocolate bar at 0.85")[2].imported).to eq(false)

      expect(parser.extract_item_details("1 imported box of chocolates at 10.00")[3].name).to eq("imported box of chocolates")
      expect(parser.extract_item_details("1 imported box of chocolates at 10.00")[3].price).to eq(10.00*100)
      expect(parser.extract_item_details("1 imported box of chocolates at 10.00")[3].quantity).to eq(1)
      expect(parser.extract_item_details("1 imported box of chocolates at 10.00")[3].imported).to eq(true)

      expect(parser.extract_item_details("1 imported bottle of perfume at 47.50")[4].name).to eq("imported bottle of perfume")
      expect(parser.extract_item_details("1 imported bottle of perfume at 47.50")[4].price).to eq(47.50*100)
      expect(parser.extract_item_details("1 imported bottle of perfume at 47.50")[4].quantity).to eq(1)
      expect(parser.extract_item_details("1 imported bottle of perfume at 47.50")[4].imported).to eq(true)

      expect(parser.extract_item_details("1 imported bottle of perfume at 27.99")[5].name).to eq("imported bottle of perfume")
      expect(parser.extract_item_details("1 imported bottle of perfume at 27.99")[5].price).to eq(27.99*100)
      expect(parser.extract_item_details("1 imported bottle of perfume at 27.99")[5].quantity).to eq(1)
      expect(parser.extract_item_details("1 imported bottle of perfume at 27.99")[5].imported).to eq(true)

      expect(parser.extract_item_details("1 bottle of perfume at 18.99")[6].name).to eq("bottle of perfume")
      expect(parser.extract_item_details("1 bottle of perfume at 18.99")[6].price).to eq(18.99*100)
      expect(parser.extract_item_details("1 bottle of perfume at 18.99")[6].quantity).to eq(1)
      expect(parser.extract_item_details("1 bottle of perfume at 18.99")[6].imported).to eq(false)

      expect(parser.extract_item_details("1 packet of headache pills at 9.75")[7].name).to eq("packet of headache pills")
      expect(parser.extract_item_details("1 packet of headache pills at 9.75")[7].price).to eq(9.75*100)
      expect(parser.extract_item_details("1 packet of headache pills at 9.75")[7].quantity).to eq(1)
      expect(parser.extract_item_details("1 packet of headache pills at 9.75")[7].imported).to eq(false)

      expect(parser.extract_item_details("1 box of imported chocolates at 11.25")[8].name).to eq("box of imported chocolates")
      expect(parser.extract_item_details("1 box of imported chocolates at 11.25")[8].price).to eq(11.25*100)
      expect(parser.extract_item_details("1 box of imported chocolates at 11.25")[8].quantity).to eq(1)
      expect(parser.extract_item_details("1 box of imported chocolates at 11.25")[8].imported).to eq(true)
    end
  end
end