module Afterbuy
  class GetShopProductsResponse < OpenStruct
  end

  module Representer
    class GetShopProductsResponseRepresenter < ResponseRepresenter
      property :result, as: :Result, class: Result do
        include ResultRepresenter

        collection :products, as: :Product, wrap: :Products, extend: ProductRepresenter, class: Product
      end
    end
  end
end
