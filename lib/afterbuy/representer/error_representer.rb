module Afterbuy
  class Error < OpenStruct
  end

  module Representer
    class ErrorRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Error

      property :code, as: :ErrorCode
      property :description, as: :ErrorDescription
      property :long_description, as: :ErrorLongDescription
    end
  end
end
