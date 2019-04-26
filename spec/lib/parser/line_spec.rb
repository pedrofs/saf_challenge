RSpec.describe SafChallenge::Parser::Line do
  describe '#call' do
    context 'when the line is invalid' do
      let(:parse_line) { described_class.call('invalid line') }

      it 'should raise InvalidLine exception' do
        expect { parse_line }.to raise_error(SafChallenge::Parser::InvalidLineError)
      end
    end
  end
end
