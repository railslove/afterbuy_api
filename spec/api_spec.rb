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

    describe '#request_params' do
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
  end
end
