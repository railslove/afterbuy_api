require 'spec_helper'

describe Afterbuy::Representer::ShopInterfaceRequestRepresenter do

  describe '#to_hash' do
    specify do
      request = Afterbuy::Representer::ShopInterfaceRequestRepresenter.new(
        Afterbuy::ShopInterfaceRequest.new({
          action: 'new',
          partner_id: 123,
          line_items: [
            Afterbuy::ShopInterfaceLineItem.new(artikel_nr: 1, artikel_name: 'Product 1'),
            Afterbuy::ShopInterfaceLineItem.new(artikel_nr: 2, artikel_name: 'Product 2')
          ]
        })
      )

      expect(request.to_hash).to eq({
        'Action'        => 'new',
        'PartnerID'     => 123,
        'Artikelnr_1'   => 1,
        'Artikelname_1' => 'Product 1',
        'Artikelnr_2'   => 2,
        'Artikelname_2' => 'Product 2'
      })
    end
  end
end
