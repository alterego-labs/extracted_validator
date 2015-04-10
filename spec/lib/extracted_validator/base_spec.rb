require 'spec_helper'

describe ExtractedValidator::Base do
  subject(:base_validator) { described_class.new(model) }

  let(:model) { double(:model) }

  it { is_expected.to respond_to :model }

  describe '#model' do
    it 'returns passed model' do
      expect(base_validator).to eq model
    end
  end

  describe '#errors' do
    it 'delegates errors to model' do
      expect(model).to receive(:errors)
      base_validator.errors
    end
  end

  describe '#errors_messages' do
    it 'delegates messages to errors' do
      expect(model).to receive_message_chain(:errors, :messages)
      base_validator.errors_messages
    end
  end

  describe '#errors_full_messages' do
    it 'delegates full_messages to errors' do
      expect(model).to receive_message_chain :errors, :full_messages
      base_validator.errors_full_messages
    end
  end
end
