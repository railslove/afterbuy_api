module Afterbuy
  class ShopInterfaceResponse < OpenStruct
  end

  module Representer
    class ShopInterfaceResponseRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :result

      property :success
      property :action, as: :Action

      nested :errorlist do
        collection :errors, as: :error
        property :order_id, as: :OrderID
        property :vid,      as: :VID
      end

      nested :data do
        property :aid,        as: :AID
        property :uid,        as: :UID
        property :kunde_nr,   as: :KundeNr
        property :e_kunde_nr, as: :EKundeNr
        property :user_id,    as: :UserID
      end
    end
  end
end
