module Afterbuy
  class GetShopProductsRequest < OpenStruct
  end

  module Representer
    class GetShopProductsRequestRepresenter < RequestRepresenter
      collection :filters, as: :DataFilter, wrap: :DataFilter, extend: DataFilterRepresenter, class: DataFilter
      # include FilterRepresenter

      # nested :data_filter, as: :DataFilter do
      #   nested :filter, as: :Filter do
      #     property :filter_name, as: :FilterName, getter: lambda {|*| "ProductID" }
      #     property :filter_value, as: :FilterValue, wrap: :FilterValues, getter: lambda {|*| self[:afterbuy_product_ids].join(";") }
      #   end
      # end


    end
  end
end
# <DataFilter>
#     <Filter>
#       <FilterName>ProductID</FilterName>
#       <FilterValues>
#         <FilterValue>1234</FilterValue>
#       </FilterValues>
#     </Filter>
#   </DataFilter>

# <AddCatalogs>
      #   <UpdateAction>1</UpdateAction>  <======= (this is the intruder here)
      #   <AddCatalog>
      #     <CatalogID>1</CatalogID>
      #     <CatalogName>First Category</CatalogName>
      #   </AddCatalog>
      #   <AddCatalog>
      #     <CatalogID>2</CatalogID>
      #     <CatalogName>Second Category</CatalogName>
      #   </AddCatalog>
      # </AddCatalogs>
      # property :add_catalogs do
      #   self.representation_wrap = :AddCatalogs
      #   property :update_action, as: :UpdateAction
      #   collection :add_catalogs do
      #     include CatalogRepresenter
      #     self.representation_wrap = :AddCatalog
      #   end
      # end