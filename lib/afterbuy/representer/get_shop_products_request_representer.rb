module Afterbuy
  class GetShopProductsRequest < OpenStruct
  end

  module Representer
    class GetShopProductsRequestRepresenter < RequestRepresenter
      collection :products, as: :Product, wrap: :Products, extend: ProductRepresenter, class: Product
    end
  end
end
