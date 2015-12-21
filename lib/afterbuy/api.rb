module Afterbuy
  class API

    METHOD_REQUEST_MAPPING = {
      'GetAfterbuyTime' => '',
      'UpdateShopProducts' => 'UpdateShopProducts',
      'GetShopProducts' => 'GetShopProducts'
    }

    METHOD_RESPONSE_MAPPING = {
      'GetAfterbuyTime' => 'Time',
      'UpdateShopProducts' => 'UpdateShopProducts',
      'GetShopProducts' => 'GetShopProducts'
    }

    attr_accessor :debug_info

    def initialize(partner_id: nil, partner_password: nil, user_id: nil, user_password: nil)
      raise ConfigMissingPartnerIDError, 'You must provide an Afterbuy partner_id'             unless Afterbuy.config.partner_id || partner_id
      raise ConfigMissingPartnerPasswordError, 'You must provide an Afterbuy partner_password' unless Afterbuy.config.partner_password || partner_password
      raise ConfigMissingUserIDError, 'You must provide an Afterbuy user_id'                   unless Afterbuy.config.user_id || user_id
      raise ConfigMissingUserPasswordError, 'You must provide an Afterbuy user_password'       unless Afterbuy.config.user_password || user_password

      @partner_id         = Afterbuy.config.partner_id || partner_id
      @partner_password   = Afterbuy.config.partner_password || partner_password
      @user_id            = Afterbuy.config.user_id || user_id
      @user_password      = Afterbuy.config.user_password || user_password
      @api_url            = Afterbuy.config.afterbuy_api_url
      @shop_interface_url = Afterbuy.config.afterbuy_shop_interface_url
    end

    def call(method_name, global_params: {}, payload: {})
      self.debug_info = { request_params: request_params(method_name, global_params, payload) }

      response = connection.post do |req|
        req.body = request_params(method_name, global_params, payload)
      end

      self.debug_info[:response_body] = response.body

      "Afterbuy::Representer::#{METHOD_RESPONSE_MAPPING[method_name]}ResponseRepresenter".constantize.new("Afterbuy::#{METHOD_RESPONSE_MAPPING[method_name]}Response".constantize.new).from_xml(response.body)
    end

    def shop_interface_call(global_params: {}, request: Afterbuy::ShopInterfaceRequest.new)
      self.debug_info = { request_params: shop_interface_request_params(global_params, request).to_hash }

      response = shop_interface_connection.post do |req|
        req.body = shop_interface_request_params(global_params, request).to_hash
      end

      self.debug_info[:response_body] = response.body

      Afterbuy::Representer::ShopInterfaceResponseRepresenter.new(Afterbuy::ShopInterfaceResponse.new).from_xml(response.body)
    end

    def connection
      @connection ||= Faraday.new(url: @api_url) do |faraday|
        faraday.headers['Content-Type'] = 'application/xml'
        faraday.adapter Faraday.default_adapter
        faraday.use Afterbuy::Middleware::ErrorDetector
      end
    end

    def shop_interface_connection
      @shop_interface_connection ||= Faraday.new(url: @shop_interface_url) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter Faraday.default_adapter
        faraday.use Afterbuy::Middleware::ErrorDetector
      end
    end

    private

      def request_params(method_name, global_params={}, payload={})
        request_params = payload.merge({
          afterbuy_global: Global.new(
            global_params.merge({
              partner_id: @partner_id,
              partner_password: @partner_password,
              user_id: @user_id,
              user_password: @user_password,
              call_name: method_name,
              detail_level: 0,
              error_language: 'EN'
            })
          )
        })

        method_request      = "Afterbuy::#{METHOD_REQUEST_MAPPING[method_name]}Request".constantize.new(request_params)
        request_representer = "Afterbuy::Representer::#{METHOD_REQUEST_MAPPING[method_name]}RequestRepresenter".constantize.new(method_request)
        return CGI.unescape_html(request_representer.to_xml)
      end

      def shop_interface_request_params(global_params={}, request=Afterbuy::ShopInterfaceRequest.new)
        request.partner_id = global_params[:partner_id] || @partner_id
        request.partner_pass = global_params[:partner_pass] || @partner_password
        request.user_id = global_params[:user_id] || @user_id

        Afterbuy::Representer::ShopInterfaceRequestRepresenter.new request
      end

  end
end
