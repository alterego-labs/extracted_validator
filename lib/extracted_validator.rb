require "extracted_validator/version"

module ExtractedValidator
  autoload :Base, 'extracted_validator/base'

  module Concerns
    autoload :AssociationsValidation, 'extracted_validator/concerns/associations_validation'
  end

  module Associations
    autoload :Base, 'extracted_validator/associations/base'
    autoload :Factory, 'extracted_validator/associations/factory'
    autoload :Singular, 'extracted_validator/associations/singular'
    autoload :Plural, 'extracted_validator/associations/plural'
  end
end
