module Afterbuy
  class GetShopProductsRequest < OpenStruct
  end

  module Representer
    class GetShopProductsRequestRepresenter < RequestRepresenter

      property :data_filter, as: :DataFilter do
        property :filter, as: :Filter do
          property :filter_name, as: :FilterName
          property :filter_values, as: :FilterValues do
            property :filter_value, as: :FilterValue
          end
        end
      end
    end
  end
end
