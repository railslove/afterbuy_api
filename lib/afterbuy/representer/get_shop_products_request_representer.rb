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


# Request/Method Call:
# `Afterbuy::API.new.call("GetShopProducts", payload: {afterbuy_product_ids: [1234] } )`

# should produce this XML:
# <Request>
#   <AfterbuyGlobal>
#     <PartnerID>108331</PartnerID>
#     <PartnerPassword>qrcBOuNOSvxGaWME6(5xfkr(r</PartnerPassword>
#     <UserID>makerist</UserID>
#     <UserPassword>11makerist99</UserPassword>
#     <CallName>GetShopProducts</CallName>
#     <DetailLevel>0</DetailLevel>
#     <ErrorLanguage>EN</ErrorLanguage>
#   </AfterbuyGlobal>
#   <DataFilter>
#     <Filter>
#       <FilterName>ProductID</FilterName>
#       <FilterValues>
#         <FilterValue>1234</FilterValue>
#       </FilterValues>
#     </Filter>
#   </DataFilter>
# </Request>
#
# but produces
#
#<Request>
#  <AfterbuyGlobal>
#    <PartnerID>108331</PartnerID>
#    <PartnerPassword>qrcBOuNOSvxGaWME6(5xfkr(r</PartnerPassword>
#    <UserID>makerist</UserID>
#    <UserPassword>11makerist99</UserPassword>
#    <CallName>GetShopProducts</CallName>
#    <DetailLevel>0</DetailLevel>
#    <ErrorLanguage>EN</ErrorLanguage>
#  </AfterbuyGlobal>
#  <get_shop_products_request>
#    <get_shop_products_request>
#      <FilterName>ProductID</FilterName>
#      <FilterValues>
#        <FilterValue>1234</FilterValue>
#      </FilterValues>
#    </get_shop_products_request>
#  </get_shop_products_request>
#</Request>