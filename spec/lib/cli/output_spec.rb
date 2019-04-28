RSpec.describe SafChallenge::CLI::Output do
  describe '#call' do
    let(:content) { '1 music CD at 10.00' }
    let(:build_cart) { SafChallenge::BuildCart.call(content) }

    subject { described_class.call(build_cart) }

    context 'when cart has one product with tax' do
      it { is_expected.to eq("1 music CD: 11.00\nSales Taxes: 1.00\nTotal: 11.00\n") }
    end

    context 'when the cart has one product free of tax' do
      let(:content) { '1 book at 10.00' }

      it { is_expected.to eq("1 book: 10.00\nSales Taxes: 0.00\nTotal: 10.00\n") }
    end
  end
end
