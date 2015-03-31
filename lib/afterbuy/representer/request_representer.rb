module Afterbuy
  class Request < OpenStruct
  end

  module Representer
    class RequestRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Request

      property :afterbuy_global, as: :AfterbuyGlobal, extend: GlobalRepresenter, class: Global
    end
  end
end
