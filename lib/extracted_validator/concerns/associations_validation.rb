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
        @assoc_validations_register = []
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
          register = assoc_validations_register
          register << ExtractedValidator::Associations::Factory.by_name(name, by)
          @assoc_validations_register = register
        end

        #
        # Returns array of registered associatiosn validations
        #
        def assoc_validations_register
          @assoc_validations_register ||= []
        end
      end

      def valid_with_associations?
        register = self.class.assoc_validations_register
        assoc_result = register.reduce(true) do |res, item|
          res && item.validate(self)
        end
        assoc_result && valid_without_associations?
      end
    end
  end
end
