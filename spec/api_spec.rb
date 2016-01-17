require 'spec_helper'

describe Afterbuy::API do

  describe 'missing configuration' do
    before(:all) do
      Afterbuy.configure do |c|
        c.partner_id = nil
        c.partner_password = nil
        c.user_id = nil
        c.user_password = nil
      end
    end
    specify do
      expect{ described_class.new }.to raise_error Afterbuy::ConfigMissingPartnerIDError
      expect{ described_class.new(partner_id: 'valid_partner_id') }.to raise_error Afterbuy::ConfigMissingPartnerPasswordError
      expect{ described_class.new(partner_id: 'valid_partner_id', partner_password: 'valid_partner_password') }.to raise_error Afterbuy::ConfigMissingUserIDError
      expect{ described_class.new(partner_id: 'valid_partner_id', partner_password: 'valid_partner_password', user_id: 'valid_user_id') }.to raise_error Afterbuy::ConfigMissingUserPasswordError
    end

    it 'allows to supply credentials via initialize' do
      expect{ described_class.new(partner_id: 'valid_partner_id', partner_password: 'valid_partner_password', user_id: 'valid_user_id', user_password: 'valid_user_password') }.not_to raise_error
    end

    it 'sets credentials from parameters' do
      api = described_class.new(partner_id: 'valid_partner_id', partner_password: 'valid_partner_password', user_id: 'valid_user_id', user_password: 'valid_user_password')
      expect(api.instance_variable_get(:@partner_id)).to eq 'valid_partner_id'
      expect(api.instance_variable_get(:@partner_password)).to eq 'valid_partner_password'
      expect(api.instance_variable_get(:@user_id)).to eq 'valid_user_id'
      expect(api.instance_variable_get(:@user_password)).to eq 'valid_user_password'
    end
  end

  describe 'valid configuration' do
    before(:all) do
      Afterbuy.configure do |c|
        c.partner_id = 'valid_partner_id'
        c.partner_password = 'valid_partner_password'
        c.user_id = 'valid_user_id'
        c.user_password = 'valid_user_password'
      end
    end

    describe '#initialize' do
      it 'initializes correctly' do
        expect{ subject }.not_to raise_error
        expect(subject).to be_kind_of Afterbuy::API
      end

      it 'sets instance variables' do
        expect(subject.instance_variable_get(:@partner_id)).to eq 'valid_partner_id'
        expect(subject.instance_variable_get(:@partner_password)).to eq 'valid_partner_password'
        expect(subject.instance_variable_get(:@user_id)).to eq 'valid_user_id'
        expect(subject.instance_variable_get(:@user_password)).to eq 'valid_user_password'
        expect(subject.instance_variable_get(:@api_url)).to eq Afterbuy.afterbuy_api_url
      end
    end

    describe '#call', :vcr do
      context 'invalid method call' do
        specify 'responds with a call not found error' do
          response = subject.call('DoSomething')
          expect(response.call_status).to eql 'Error'
          expect(response.result.errors).to_not be_empty
          expect(response.result.errors.first.description).to eql 'Unsupported CallName.'
        end
      end

      context 'GetAfterbuyTime' do
        specify 'responds with timestamps' do
          response = subject.call('GetAfterbuyTime')
          expect(response.call_status).to eql 'Success'
          expect(response.result.errors).to be_nil
          expect(response.result.afterbuy_timestamp).to_not be_nil
          expect(response.result.afterbuy_universal_timestamp).to_not be_nil
        end
      end
    end

    describe '#shop_interface_call', :vcr do
      context 'invalid parameters' do
        specify 'fails with error' do
          response = subject.shop_interface_call(request: Afterbuy::ShopInterfaceRequest.new(action: 'new'))
          expect(response.success).to eql '0'
          expect(response.errors).to_not be_empty
        end
      end

      context 'valid parameters with action CheckUserId' do
        specify 'succeeds and returns the user_id' do
          response = subject.shop_interface_call(request: Afterbuy::ShopInterfaceRequest.new(action: 'CheckUserId'))
          expect(response.success).to eql '1'
          expect(response.user_id).to eql '123456'
        end
      end

      context 'valid parameters with action new' do
        specify 'succeeds' do
          request = Afterbuy::ShopInterfaceRequest.new({
            action: 'new',
            k_benutzername: 'carl_client',
            k_email: 'client@mail.de',
            k_vorname: 'Carl',
            k_nachname: 'Client',
            k_strasse: 'Clientstr. 4',
            k_plz: '12345',
            k_ort: 'Carlhausen',
            k_land: 'D',
            line_items: [
              Afterbuy::ShopInterfaceLineItem.new(
                artikel_nr: 1,
                artikel_name: 'Product 1',
                artikel_mwst: 19,
                artikel_menge: 1,
                artikel_e_preis: '9,99'
              ),
              Afterbuy::ShopInterfaceLineItem.new(
                artikel_nr: 2,
                artikel_name: 'Product 2',
                artikel_mwst: 19,
                artikel_menge: 2,
                artikel_e_preis: '6,99'
              )
            ]
          })
          response = subject.shop_interface_call(request: request)
          expect(response.success).to eql '1'
          expect(response.aid).to_not be_nil
          expect(response.uid).to_not be_nil
          expect(response.kunden_nr).to_not be_nil
          expect(response.e_kunden_nr).to_not be_nil
          expect(response.coupon_used).to_not be_nil
        end
      end
    end

    describe '#request_params' do
      context 'without a payload' do
        specify do
          expect(subject.send(:request_params, 'DoSomething')).to eql %q|<Request>
  <AfterbuyGlobal>
    <PartnerID>valid_partner_id</PartnerID>
    <PartnerPassword>valid_partner_password</PartnerPassword>
    <UserID>valid_user_id</UserID>
    <UserPassword>valid_user_password</UserPassword>
    <CallName>DoSomething</CallName>
    <DetailLevel>0</DetailLevel>
    <ErrorLanguage>EN</ErrorLanguage>
  </AfterbuyGlobal>
</Request>|
        end
      end

      context 'with extra global_params and payload' do
        specify do
          payload = { products: [] }
          payload[:products] << Afterbuy::Product.new({
            product_ident: OpenStruct.new(product_id: 123),
            name: "a product"
          })
          expect(subject.send(:request_params, 'UpdateShopProducts', { error_language: 'DE'}, payload)).to eql %q|<Request>
  <AfterbuyGlobal>
    <PartnerID>valid_partner_id</PartnerID>
    <PartnerPassword>valid_partner_password</PartnerPassword>
    <UserID>valid_user_id</UserID>
    <UserPassword>valid_user_password</UserPassword>
    <CallName>UpdateShopProducts</CallName>
    <DetailLevel>0</DetailLevel>
    <ErrorLanguage>EN</ErrorLanguage>
  </AfterbuyGlobal>
  <Products>
    <Product>
      <ProductIdent>
        <ProductID>123</ProductID>
      </ProductIdent>
      <Name>a product</Name>
    </Product>
  </Products>
</Request>|
        end
      end
    end
  end
end
