module Afterbuy
  class API

    METHOD_RESPONSE_MAPPING = {
      'GetAfterbuyTime' => 'Time'
    }

    def initialize(partner_id: nil, partner_password: nil, user_id: nil, user_password: nil)
      raise ConfigMissingPartnerIDError, 'You must provide an Afterbuy partner_id'             unless Afterbuy.config.partner_id || partner_id
      raise ConfigMissingPartnerPasswordError, 'You must provide an Afterbuy partner_password' unless Afterbuy.config.partner_password || partner_password
      raise ConfigMissingUserIDError, 'You must provide an Afterbuy user_id'                   unless Afterbuy.config.user_id || user_id
      raise ConfigMissingUserPasswordError, 'You must provide an Afterbuy user_password'       unless Afterbuy.config.user_password || user_password

      @partner_id       = Afterbuy.config.partner_id || partner_id
      @partner_password = Afterbuy.config.partner_password || partner_password
      @user_id          = Afterbuy.config.user_id || user_id
      @user_password    = Afterbuy.config.user_password || user_password
      @api_url          = Afterbuy.config.afterbuy_api_url
    end

    def call(method_name, params={})
      response = connection.post do |req|
        req.body = request_params(method_name, params)
      end
      "Afterbuy::Representer::#{METHOD_RESPONSE_MAPPING[method_name]}ResponseRepresenter".constantize.new("Afterbuy::#{METHOD_RESPONSE_MAPPING[method_name]}Response".constantize.new).from_xml(response.body)
    end

    def connection
      @connection ||= Faraday.new(url: @api_url) do |faraday|
        faraday.headers['Content-Type'] = 'application/xml'
        faraday.adapter Faraday.default_adapter
        faraday.use Afterbuy::Middleware::ErrorDetector
      end
    end

    private

      def request_params(method_name, params={})
        Representer::RequestRepresenter.new(
          Request.new({
            AfterbuyGlobal:
              Global.new(
                params.merge({
                  PartnerID: @partner_id,
                  PartnerPassword: @partner_password,
                  UserID: @user_id,
                  UserPassword: @user_password,
                  CallName: method_name,
                  DetailLevel: 0
                })
              )
          })
        ).to_xml
      end

  end
end
