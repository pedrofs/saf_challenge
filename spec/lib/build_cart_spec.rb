RSpec.describe SafChallenge::BuildCart do
  describe '#call' do
    let(:build_cart) { described_class.call(content) }

    context 'when it has one basic taxed product' do
      let(:content) { "1 music CD at 15.00" }

      describe '.products.count' do
        subject { build_cart.products.count }

        it { is_expected.to eq(1) }
      end

      describe '.products.collect(&:taxes)' do
        subject { build_cart.products.collect(&:taxes).flatten.collect(&:class) }

        it { is_expected.to eq([SafChallenge::Taxes::BasicSaleTax]) }
      end
    end

    context 'when it has two products' do
      context 'when imported and basic taxed and another exempt product' do
        let(:content) { "1 imported music CD at 15.00\n1 book at 15.00" }

        describe '.products.count' do
          subject { build_cart.products.count }

          it { is_expected.to eq(2) }
        end

        describe '.products.collect(&:taxes)' do
          subject { build_cart.products.collect(&:taxes).flatten.collect(&:class) }

          it do
            is_expected.to eq([SafChallenge::Taxes::BasicSaleTax,
                               SafChallenge::Taxes::ImportedTax])
          end
        end
      end
    end

    context 'when it has line error' do
      let(:content) { "1 imported music CD at 15.00\nbook at 15.00" }

      it 'should raise InvalidLine exception' do
        expect { build_cart }.to raise_error(SafChallenge::Parser::InvalidLineError)
      end
    end
  end
end
