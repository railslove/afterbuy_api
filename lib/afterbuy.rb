require 'active_support/configurable'
require 'active_support/inflector'
require 'faraday'
require 'ostruct'
require 'roar/decorator'
require 'roar/xml'

require 'afterbuy/version'
require 'afterbuy/errors'

require 'afterbuy/middleware/error_detector'

require 'afterbuy/representer/global'
require 'afterbuy/representer/request'

require 'afterbuy/representer/error'
require 'afterbuy/representer/warning'
require 'afterbuy/representer/result'
require 'afterbuy/representer/response'
require 'afterbuy/representer/time_response'

require 'afterbuy/api'

module Afterbuy
  include ActiveSupport::Configurable

  config_accessor(:partner_id)
  config_accessor(:partner_password)
  config_accessor(:user_id)
  config_accessor(:user_password)
  config_accessor(:afterbuy_api_url) { 'https://api.afterbuy.de/afterbuy/ABInterface.aspx' }
end
