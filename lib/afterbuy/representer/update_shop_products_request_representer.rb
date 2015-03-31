module Afterbuy
  class UpdateShopProductsRequest < OpenStruct
  end

  module Representer
    class UpdateShopProductsRequestRepresenter < RequestRepresenter
      collection :Products
    end
  end
end
