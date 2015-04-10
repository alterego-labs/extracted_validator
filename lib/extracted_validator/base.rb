require 'delegate'
require 'active_record'
require 'active_support/core_ext/module/delegation'

module ExtractedValidator
  class Base < SimpleDelegator
    include ActiveRecord::Validations

    alias_method :model, :__getobj__

    delegate :errors, to: :model

    delegate :messages,
             :full_messages,
             to: :errors, prefix: true

    def method_missing(name, *args, &block)
      model.send name, *args, &block
    end

    def add_error(message, scope: :base)
      errors[scope] << message
    end
  end
end
