RSpec.describe SafChallenge::CLI::FromFile do
  describe '#call' do
    context 'when a valid file is passed' do
      subject { described_class.call([File.join('spec', 'fixtures', 'input.txt')]) }

      it { is_expected.to eq("file content\n") }
    end

    context 'when non existent file is passed' do
      let(:handle_input) { described_class.call(['file_doesnt_exist.txt']) }

      it 'should raise a file doest not exception' do
        expect { handle_input }.to raise_error(SafChallenge::CLI::FromFile::FileDoesNotExistError)
      end
    end

    context 'when no file is passed' do
      let(:handle_input) { described_class.call }

      it 'should raise a invalid arguments exception' do
        expect { handle_input }.to raise_error(SafChallenge::CLI::FromFile::InvalidArgumentError)
      end
    end
  end
end
