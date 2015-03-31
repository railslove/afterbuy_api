module Afterbuy
  class Global < OpenStruct
  end

  module Representer
    class GlobalRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :AfterbuyGlobal

      property :PartnerID
      property :PartnerPassword
      property :UserID
      property :UserPassword
      property :CallName
      property :DetailLevel
      property :ErrorLanguage
    end
  end
end
