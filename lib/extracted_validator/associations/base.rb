require 'active_support/core_ext/string/inflections'

module ExtractedValidator
  module Associations
    class Base < Struct.new(:name, :validator_class)
      def validate(_object)
        fail NotImplementedError, "#{self.class.name} is an abstract class!"
      end

      protected

      def process_association_element(element, object)
        validator = validator_class.new(element)
        validation_result = validator.valid?
        copy_error_messages validator, object
        validation_result
      end

      def copy_error_messages(validator, object)
        validator.errors_messages.each do |(scope, message)|
          object.add_error message, scope: scope
        end
      end
    end
  end
end
