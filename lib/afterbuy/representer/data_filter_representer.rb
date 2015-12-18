module Afterbuy
  class DataFilter < OpenStruct

  end

  module Representer
    class DataFilterRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :DataFilter
    end
  end
end
