module Afterbuy
  class UpdateShopProductsResponse < OpenStruct
  end

  module Representer
    class UpdateShopProductsResponseRepresenter < ResponseRepresenter
      property :result, as: :Result, class: Result do
        include ResultRepresenter

        collection :new_products, as: :Product, wrap: :NewProducts, extend: ProductRepresenter, class: Product
        property :new_product, as: :NewProduct, extend: ProductRepresenter, class: Product
      end
    end
  end
end
