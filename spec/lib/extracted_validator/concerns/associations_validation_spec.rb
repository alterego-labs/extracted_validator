require 'spec_helper'

class AssociationsValidationSpec
  def valid?
  end

  include ExtractedValidator::Concerns::AssociationsValidation
end

describe ExtractedValidator::Concerns::AssociationsValidation do
  subject(:concern) { AssociationsValidationSpec }

  context 'adds class methods' do
    it { is_expected.to respond_to :validating }
    it { is_expected.to respond_to :assoc_validations_register }
  end

  context 'adds instance methods' do
    subject(:validator) { AssociationsValidationSpec.new }

    it { is_expected.to respond_to :valid_with_associations? }
    it { is_expected.to respond_to :valid_without_associations? }
  end
end
