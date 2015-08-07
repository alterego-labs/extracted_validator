require 'spec_helper'

include ExtractedValidator::Associations

describe ExtractedValidator::Associations::Factory do
  subject(:factory) { described_class }

  describe '.by_name' do
    subject(:builded_assoc) { factory.by_name(name, validator_class) }

    let(:validator_class) { double }

    context 'when plural association' do
      let(:name) { :comments }

      it { is_expected.to be_kind_of Plural }
    end

    context 'when singular association' do
      let(:name) { :comment }

      it { is_expected.to be_kind_of Singular }
    end
  end
end
