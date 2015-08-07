require 'spec_helper'

describe ExtractedValidator::Associations::Plural do
  subject(:association) { described_class.new(:comments, double) }

  include_examples 'acts as association base'
end

