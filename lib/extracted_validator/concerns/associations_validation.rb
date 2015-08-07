require 'active_support'
require 'active_support/core_ext/module/aliasing'
require 'active_support/core_ext/class/attribute_accessors'

module ExtractedValidator
  module Concerns
    #
    # Adds ability to validate associations.
    #
    module AssociationsValidation
      extend ActiveSupport::Concern

      NoValidatorProvidedError = Class.new(StandardError)

      included do
        cattr_reader :assoc_validations_register
        @@assoc_validations_register = []
        alias_method_chain :valid?, :associations
      end

      module ClassMethods
        #
        # Adds association validation
        #
        # Parameters:
        # name - associstion name
        # *by* - class of validator
        #
        def validating(name, by: nil)
          raise NoValidatorProvidedError if by.nil?
          @@assoc_validations_register << name
        end
      end

      def valid_with_associations?
      end
    end
  end
end
