require 'active_support/configurable'
require 'active_support/inflector'
require 'faraday'
require 'ostruct'
require 'roar/decorator'
require 'roar/xml'

require 'afterbuy/version'
require 'afterbuy/errors'

require 'afterbuy/middleware/error_detector'

require 'afterbuy/representer/global_representer'
require 'afterbuy/representer/request_representer'

require 'afterbuy/representer/error_representer'
require 'afterbuy/representer/warning_representer'
require 'afterbuy/representer/result_representer'
require 'afterbuy/representer/response_representer'
require 'afterbuy/representer/time_response_representer'

require 'afterbuy/api'

module Afterbuy
  include ActiveSupport::Configurable

  config_accessor(:partner_id)
  config_accessor(:partner_password)
  config_accessor(:user_id)
  config_accessor(:user_password)
  config_accessor(:afterbuy_api_url) { 'https://api.afterbuy.de/afterbuy/ABInterface.aspx' }
end
