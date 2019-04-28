RSpec.describe SafChallenge::Parser::Content do
  describe '.collect' do
    context 'when there are two products' do
      let(:content) do
        "1 chocolate at 45.00\n2 pills at 15.00"
      end

      context 'when it collects quantity' do
        subject { described_class.new(content).collect(&:quantity) }

        it { is_expected.to eq([1, 2]) }
      end

      context 'when it collects description' do
        subject { described_class.new(content).collect(&:description) }

        it { is_expected.to eq(['chocolate', 'pills']) }
      end

      context 'when it collects cost' do
        subject { described_class.new(content).collect(&:cost) }

        it { is_expected.to eq([45.00, 15.00]) }
      end

      context 'when content is empty' do
        let(:content) { '' }

        subject { described_class.new(content).collect(&:cost) }

        it 'raises error' do
          expect { subject }.to raise_error(SafChallenge::Parser::Content::EmptyContentError)
        end
      end
    end
  end
end
