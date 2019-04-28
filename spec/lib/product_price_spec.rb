require 'ostruct'

RSpec.describe SafChallenge::ProductPrice do
  describe '#call' do
    let(:cost) { 10.5 }
    let(:product) { OpenStruct.new(cost: cost, taxes: taxes) }

    subject { described_class.call(product) }

    context 'when the product doesnt contain taxes' do
      let(:taxes) { [] }

      it { is_expected.to eq(10.5) }
    end

    context 'when the product has one ten percent tax' do
      let(:tax_one) { OpenStruct.new(fee: 0.1) }
      let(:taxes) { [tax_one] }

      before do
        tax_one.product = product
      end

      it { is_expected.to eq(11.55) }
    end

    context 'when the product has one ten percent tax and another five percent tax' do
      let(:tax_one) { OpenStruct.new(fee: 0.1) }
      let(:tax_two) { OpenStruct.new(fee: 0.05) }

      let(:taxes) { [tax_one, tax_two] }

      before do
        tax_one.product = product
        tax_two.product = product
      end

      it { is_expected.to eq(12.1) }
    end
  end
end
