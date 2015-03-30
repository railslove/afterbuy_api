module Afterbuy
  class Request < OpenStruct
  end

  module Representer
    class RequestRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Request

      property :AfterbuyGlobal, extend: GlobalRepresenter, class: Global
    end
  end
end
