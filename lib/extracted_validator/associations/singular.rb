module ExtractedValidator
  module Associations
    class Singular < Base
      def validate(object)
        item = object.send name
        process_assoc_item item, object
      end
    end
  end
end
