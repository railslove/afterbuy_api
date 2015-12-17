module Afterbuy
  class GetShopProductsRequest < OpenStruct
  end

  module Representer
    class GetShopProductsRequestRepresenter < RequestRepresenter

      nested :data_filter, as: :DataFilter do
        nested :filter, as: :Filter do
          property :filter_name, as: :FilterName, getter: lambda {|*| "ProductID" }
          property :filter_value, as: :FilterValue, wrap: :FilterValues, getter: lambda {|*| self[:afterbuy_product_ids].join(";") }
        end
      end

    end
  end
end
