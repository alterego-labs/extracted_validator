module ExtractedValidator
  module Associations
    class Factory
      class << self
        def by_name(name, validator_class)
          build_assoc_class(name).new name, validator_class
        end

        private

        def build_assoc_class(name)
          prefix = prefix_for(name).to_s.capitalize
          built_class_name(prefix).constantize
        end

        def singular?(name)
          name.to_s.singularize == name.to_s
        end

        def prefix_for(name)
          singular?(name) ? :singular : :plural
        end

        def namespace
          'ExtractedValidator::Associations::'
        end

        def built_class_name(prefix)
          "#{namespace}#{prefix}"
        end
      end
    end
  end
end
