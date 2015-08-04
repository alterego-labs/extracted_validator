require 'delegate'
require 'active_record'
require 'active_support/core_ext/module/delegation'

module ExtractedValidator
  ##
  # Creates custom, use-case-dependently validators.
  # There are many cases when one model takes place in several use cases
  # requiring different validation logic. You may stuff goal model
  # with some conditions whether using this validation or not.
  # Due to this you model will swell and eventually become ugly part of code.
  #
  # ==== Example
  #
  # Lets defining validator when user signing up:
  # # class UserSignUpValidator < ExtractedValidator::Base[User]
  # #   validates :first_name, presence: true
  # #   validates :last_name, presence: true
  # # end
  #
  # And now in your use-case class use it:
  # # is_valid = UserSignUpValidator.new(new_user).valid?
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

    def self.method_missing(name, *args, &block)
      model_class.send name, *args, &block
    end

    def self.[](model)
      Class.new(self) do
        define_singleton_method :model_class do
          model
        end

        define_singleton_method :model_name do
          ActiveModel::Name.new(model)
        end
      end
    end
  end
end
