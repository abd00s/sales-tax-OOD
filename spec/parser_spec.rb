require 'rspec'
require './parser'

RSpec.describe Parser do
  let(:file) { "input/input1.txt"}
  let(:parser) {Parser.new(file)}

  # describe 'split_input' do
  #   it 'Arranges line items in array as strings' do
  #     expect(true).to eq(true)
  #   end
  # end

end