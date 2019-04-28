require 'ostruct'

RSpec.describe SafChallenge::TaxPrice do
  let(:tax) { OpenStruct.new(product: product, fee: tax_value) }

  subject { described_class.call(tax) }

  context 'when tax it ten percent' do
    let(:tax_value) { 0.1 }

    context 'when product cost is well rounded' do
      let(:product) { OpenStruct.new(cost: 10) }

      describe '#call' do
        it { is_expected.to eq(1) }
      end
    end

    context 'when product cost is not well rounded and the tax needs 0.05 rounding' do
      let(:product) { OpenStruct.new(cost: 10.32) }

      describe '#call' do
        it { is_expected.to eq(1.05) }
      end
    end
  end
end
