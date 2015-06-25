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
        # data receive when action is CheckUserId
        property :user_id,     as: :UserID

        # data receive when action is new
        property :aid,         as: :AID
        property :uid,         as: :UID
        property :kunden_nr,   as: :KundenNr
        property :e_kunden_nr, as: :EKundenNr
        property :coupon_used, as: :CouponUsed
      end
    end
  end
end
