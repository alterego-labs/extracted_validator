module ExtractedValidator
  module Associations
    class Plural < Base
      def validate(object)
        items = object.send name
        items.reduce(true) do |res, item|
          res && process_assoc_item(item, object)
        end
      end
    end
  end
end

