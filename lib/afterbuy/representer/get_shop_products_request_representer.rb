module Afterbuy
  class GetShopProductsRequest < OpenStruct
  end

  module Representer
    class GetShopProductsRequestRepresenter < RequestRepresenter

      # nested :data_filter, as: :DataFilter do
      #   nested :filter, as: :Filter do
      #     property :filter_name, as: :FilterName, getter: lambda {|*| "ProductID" }
      #     property :filter_value, as: :FilterValue, wrap: :FilterValues, getter: lambda {|*| self[:afterbuy_product_ids].join(";") }
      #   end
      # end
      property :data_filter, as: :DataFilter, exec_context: :decorator

      def data_filter
        "<DataFilter><Filter><FilterName>ProductID</FilterName><FilterValues><FilterValue>#{represented[:afterbuy_product_ids].join(";")}</FilterValue></FilterValues></Filter></DataFilter>"
        # {'Filter' => {'FilterName' => 'ProductID', 'FilterValues' => {'FilterValue' => represented[:afterbuy_product_ids].join(";")}}}.to_xml(root: 'DataFilter', skip_instruct: true)
        # "<DataFilter>
        #   <Filter>
        #     <FilterName></FilterName>
        #     <FilterValues>
        #       <FilterValue>#{represented[:afterbuy_product_ids].join(";")}</FilterValue>
        #     </FilterValues>
        #   </Filter>
        # </DataFilter>"
      end
    end
  end
end
