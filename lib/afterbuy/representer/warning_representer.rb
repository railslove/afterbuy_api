module Afterbuy
  class Warning < OpenStruct
  end

  module Representer
    class WarningRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Warning

      property :code, as: :WarningCode
      property :description, as: :WarningDescription
      property :long_description, as: :WarningLongDescription
    end
  end
end
