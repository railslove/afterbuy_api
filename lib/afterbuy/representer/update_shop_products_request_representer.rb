module Afterbuy
  class UpdateShopProductsRequest < OpenStruct
  end

  module Representer
    class UpdateShopProductsRequestRepresenter < RequestRepresenter
      collection :products, as: :Product, wrap: :Products, extend: ProductRepresenter, class: Product
    end
  end
end
