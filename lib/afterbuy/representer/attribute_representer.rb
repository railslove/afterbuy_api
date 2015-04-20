module Afterbuy
  class Attribute < OpenStruct
  end

  module Representer
    module AttributeRepresenter
      include Roar::XML

      self.representation_wrap = :Attribut # german ftw

      property :name, as: :AttributName
      property :value, as: :AttributValue
      property :type, as: :AttributTyp
      property :position, as: :AttributPosition
      property :required, as: :AttributRequired
    end
  end
end
