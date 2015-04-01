module Afterbuy
  class ProductPicture < OpenStruct
  end

  module Representer
    class ProductPictureRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :ProductPicture

      property :nr, as: :Nr
      property :url, as: :Url
      property :alt_text, as: :AltText
      collection :children, as: :ProductPicture, wrap: :Childs, extend: ProductPictureRepresenter, class: ProductPicture
    end
  end
end
