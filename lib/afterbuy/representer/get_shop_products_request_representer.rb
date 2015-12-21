module Afterbuy
    class GetShopProductsRequest < OpenStruct

      def data_filter
        xml_s = []
        xml_s << "<Filter>"
        xml_s << "  <FilterName>#{self.filter_name}</FilterName>"
        xml_s << "  <FilterValues>"
        xml_s << "    <FilterValue>#{self.filter_value}</FilterValue>"
        xml_s << "  </FilterValues>"
        xml_s << "</Filter>"

        xml_s.join("\n")
      end

    end

  module Representer
    class GetShopProductsRequestRepresenter < RequestRepresenter

      property :data_filter, as: :DataFilter

    end
  end
end
