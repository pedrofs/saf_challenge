RSpec.describe SafChallenge::Parser::Line do
  describe '#call' do
    let(:parse_line) { described_class.call(line) }

    context 'when the line is invalid' do
      let(:line) { 'invalid line' }

      it 'should raise InvalidLine exception' do
        expect { parse_line }.to raise_error(SafChallenge::Parser::Line::InvalidLineError)
      end

      context 'when it is missing quantity' do
        let(:line) { 'music CD at 14.99' }

        it 'should raise InvalidLine exception' do
          expect { parse_line }.to raise_error(SafChallenge::Parser::Line::InvalidLineError)
        end
      end
    end

    context 'when the line is valid' do
      let(:line) { '1 music CD at 14.99' }

      describe '.quantity' do
        subject { parse_line.quantity }

        it { is_expected.to eq(1) }
      end

      describe '.imported' do
        subject { parse_line.imported }

        it { is_expected.to eq(false) }
      end

      describe '.description' do
        subject { parse_line.description }

        it { is_expected.to eq('music CD') }
      end

      describe '.cost' do
        subject { parse_line.cost }

        it { is_expected.to eq(14.99) }
      end

      context 'when line is imported' do
        let(:line) { '1 imported music CD at 14.99' }

        describe '.description' do
          subject { parse_line.description }

          it { is_expected.to eq('imported music CD') }
        end

        context 'but starts with box' do
          let(:line) { '3 box of imported chocolates at 11.25' }

          describe '.imported' do
            subject { parse_line.imported }

            it { is_expected.to eq(true) }
          end

          describe '.description' do
            subject { parse_line.description }

            it { is_expected.to eq('box of imported chocolates') }
          end
        end
      end
    end
  end
end
