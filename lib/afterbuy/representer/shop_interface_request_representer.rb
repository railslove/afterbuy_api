module Afterbuy
  class ShopInterfaceRequest < OpenStruct
  end

  module Representer
    class ShopInterfaceRequestRepresenter < Roar::Decorator
      include Representable::Hash

      property :action,                  as: :Action
      property :partner_id,              as: :PartnerID
      property :partner_pass,            as: :PartnerPass
      property :user_id,                 as: :UserID
      property :pos_anz,                 as: :PosAnz
      property :k_benutzername,          as: :Kbenutzername
      property :k_anrede,                as: :Kanrede
      property :k_firma,                 as: :KFirma
      property :k_vorname,               as: :KVorname
      property :k_nachname,              as: :KNachname
      property :k_strasse,               as: :KStrasse
      property :k_strasse2,              as: :KStrasse2
      property :k_plz,                   as: :KPLZ
      property :k_ort,                   as: :KOrt
      property :k_bundesland,            as: :KBundesland
      property :k_telefon,               as: :Ktelefon
      property :k_fax,                   as: :Kfax
      property :k_email,                 as: :Kemail
      property :k_land,                  as: :KLand
      property :k_birthday,              as: :KBirthday
      property :lieferanschrift,         as: :Lieferanschrift
      property :kl_firma,                as: :KLFirma
      property :kl_vorname,              as: :KLVorname
      property :kl_nachname,             as: :KLNachname
      property :kl_strasse,              as: :KLStrasse
      property :kl_strasse2,             as: :KLStrasse2
      property :kl_plz,                  as: :KLPLZ
      property :kl_ort,                  as: :KLOrt
      property :kl_land,                 as: :KLLand
      property :kl_telefon,              as: :KLTelefon
      property :haendler,                as: :Haendler
      property :kommentar,               as: :Kommentar
      property :use_compl_weight,        as: :UseComplWeight
      property :buy_date,                as: :BuyDate
      property :bestandart,              as: :Bestandart
      property :versandart,              as: :Versandart
      property :versandkosten,           as: :Versandkosten
      property :zahlarten_aufschlag,     as: :ZahlartenAufschlag
      property :zahlart,                 as: :Zahlart
      property :z_funktions_id,          as: :ZFunktionsID
      property :bankname,                as: :Bankname
      property :blz,                     as: :BLZ
      property :kontonummer,             as: :Kontonummer
      property :kontoinhaber,            as: :Kontoinhaber
      property :usst_id,                 as: :UsStID
      property :no_feedback,             as: :NoFeedback
      property :no_versand_calc,         as: :NoVersandCalc
      property :versandgruppe,           as: :Versandgruppe
      property :mwst_nicht_ausweisen,    as: :MwStNichtAusweisen
      property :markierung_id,           as: :MarkierungID
      property :e_kunden_nr,             as: :EKundenNr
      property :kunden_erkennung,        as: :Kundenerkennung
      property :no_ebay_name_aktu,       as: :NoeBayNameAktu
      property :artikel_erkennung,       as: :Artikelerkennung
      property :v_memo,                  as: :VMemo
      property :vid,                     as: :VID
      property :sold_currency,           as: :SoldCurrency
      property :set_pay,                 as: :SetPay
      property :pay_date,                as: :PayDate
      property :check_vid,               as: :CheckVID
      property :check_packstation,       as: :CheckPackstation
      property :override_mark_id,        as: :OverrideMarkID
      property :billsafe_transaction_id, as: :BillsafeTransactionID
      property :billsafe_ordernumber,    as: :BillsafeOrdernumber
      property :bic,                     as: :BIC
      property :iban,                    as: :IBAN
      property :reference,               as: :reference
      property :payment_status,          as: :PaymentStatus
      property :payment_transaction_id,  as: :PaymentTransactionId

      collection :line_items, extend: ShopInterfaceLineItemRepresenter, class: ShopInterfaceLineItem

      def to_hash
        super.tap do |hash|
          if hash.has_key? 'line_items'
            hash.delete('line_items').each.with_index do |line_item, index|
              line_item.map do |k, v|
                hash["#{k}_#{index+1}"] = v
              end
            end
          end
        end
      end

    end
  end
end
