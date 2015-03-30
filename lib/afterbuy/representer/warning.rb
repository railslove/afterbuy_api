module Afterbuy
  class Warning < OpenStruct
  end

  module Representer
    class WarningRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Warning

      property :WarningCode
      property :WarningDescription
      property :WarningLongDescription
    end
  end
end
