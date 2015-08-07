require 'spec_helper'

describe ExtractedValidator::Associations::Singular do
  subject(:association) { described_class.new(:comment, double) }

  include_examples 'acts as association base'
end
