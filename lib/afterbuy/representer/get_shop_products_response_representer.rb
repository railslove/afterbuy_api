module Afterbuy
  class GetShopProductsResponse < OpenStruct
  end

  module Representer
    class GetShopProductsResponseRepresenter < ResponseRepresenter
      property :result, as: :Result, class: Result do
        include ResultRepresenter

        property   :parts_found,  as: :PartsFound
        property   :skus_found,   as: :SkusFound
        collection :new_products, as: :NewProduct, wrap: :NewProducts, extend: ProductRepresenter, class: Product
      end
    end
  end
end
