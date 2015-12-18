module Afterbuy
  class DataFilter < OpenStruct

  end

  module Representer
    class DataFilterRepresenter < Roar::Decorator
      include Roar::XML

      property :add_data_filter do
        self.representation_wrap = :DataFilter
        # include FilterRepresenter
      end

    end
  end
end
