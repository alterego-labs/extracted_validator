require "extracted_validator/version"

module ExtractedValidator
  autoload :Base, 'extracted_validator/base'

  module Concerns
    autoload :AssociationsValidation, 'extracted_validator/concerns/associations_validation'
  end
end
