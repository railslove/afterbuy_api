module Afterbuy
  class Global < OpenStruct
  end

  module Representer
    class GlobalRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :AfterbuyGlobal

      property :partner_id, as: :PartnerID
      property :partner_password, as: :PartnerPassword
      property :user_id, as: :UserID
      property :user_password, as: :UserPassword
      property :call_name, as: :CallName
      property :detail_level, as: :DetailLevel
      property :error_language, as: :ErrorLanguage
    end
  end
end
