module Afterbuy
  class Catalog < OpenStruct
  end

  module Representer
    module CatalogRepresenter
      include Roar::XML

      self.representation_wrap = :Catalog

      property :id, as: :CatalogID
      property :name, as: :CatalogName
      property :level, as: :CatalogLevel
    end
  end
end
