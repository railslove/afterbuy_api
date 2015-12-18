module Afterbuy
  class Filter < OpenStruct
  end

  module Representer
    class FilterRepresenter < Roar::Decorator
      include Roar::XML

      # property :add_data_filter do
        # self.representation_wrap = :DataFilter
        # include FilterRepresenter
        collection :add_data_filter do
          self.representation_wrap = :Filter
          collection :add_data_filter do
            property :filter_name, as: :FilterName, getter: lambda {|*| "ProductID" }
            property :filter_value, as: :FilterValue, wrap: :FilterValues, getter: lambda {|*| self[:afterbuy_product_ids].join(";") }
          end
        end
      # end
    end
  end
end