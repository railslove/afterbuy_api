module Afterbuy
  class Error < OpenStruct
  end

  module Representer
    class ErrorRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Error

      property :ErrorCode
      property :ErrorDescription
      property :ErrorLongDescription
    end
  end
end
