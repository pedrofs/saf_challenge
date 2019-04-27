RSpec.describe SafChallenge::BuildTaxes do
  describe '.call' do
    let(:build_taxes) { described_class.new.call(parsed_line) }

    context 'when product basic' do
      let(:parsed_line) do
        OpenStruct.new(description: 'music CD', imported: false)
      end

      describe 'count' do
        subject { build_taxes.count }

        it { is_expected.to eq(1) }
      end

      describe 'collects the tax classes' do
        subject { build_taxes.collect(&:class) }

        it { is_expected.to eq([SafChallenge::Taxes::BasicSaleTax]) }
      end

      context 'when it is imported' do
        let(:parsed_line) do
          OpenStruct.new(description: 'music CD', imported: true)
        end

        describe 'count' do
          subject { build_taxes.count }

          it { is_expected.to eq(2) }
        end

        describe 'collects the tax classes' do
          subject { build_taxes.collect(&:class) }

          it { is_expected.to eq([SafChallenge::Taxes::BasicSaleTax, SafChallenge::Taxes::ImportedTax]) }
        end
      end
    end

    context 'when product is exempt from basic sale tax' do
      let(:parsed_line) do
        OpenStruct.new(description: 'chocolate', imported: false)
      end

      describe 'count' do
        subject { build_taxes.count }

        it { is_expected.to eq(0) }
      end

      context 'when it is imported' do
        let(:parsed_line) do
          OpenStruct.new(description: 'imported book', imported: true)
        end

        describe 'count' do
          subject { build_taxes.count }

          it { is_expected.to eq(1) }
        end

        describe 'collects the tax classes' do
          subject { build_taxes.collect(&:class) }

          it { is_expected.to eq([SafChallenge::Taxes::ImportedTax]) }
        end
      end
    end
  end
end
