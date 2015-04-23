module Afterbuy
  class ShopInterfaceLineItem < OpenStruct
  end

  module Representer
    class ShopInterfaceLineItemRepresenter < Roar::Decorator
      include Representable::Hash

      property :artikel_nr,            as: :Artikelnr
      property :altern_artikel_nr1,    as: :AlternArtikelNr1
      property :altern_artikel_nr2,    as: :AlternArtikelNr2
      property :artikel_name,          as: :Artikelname
      property :artikel_e_preis,       as: :ArtikelEpreis
      property :artikel_mwst,          as: :ArtikelMwSt
      property :artikel_menge,         as: :ArtikelMenge
      property :artikel_gewicht,       as: :ArtikelGewicht
      property :artikel_link,          as: :ArtikelLink
      property :attribute,             as: :Attribute
      property :artikel_stamm_id,      as: :ArtikelStammID
    end
  end
end
