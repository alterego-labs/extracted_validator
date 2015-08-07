module ExtractedValidator
  module Associations
    class Singular < Base
      def validate(object)
        item = object.send name
        process_association_element item, object
      end
    end
  end
end
