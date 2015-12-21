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

require 'afterbuy/representer/catalog_representer'
require 'afterbuy/representer/product_picture_representer'
require 'afterbuy/representer/attribute_representer'
require 'afterbuy/representer/product_representer'
require 'afterbuy/representer/get_shop_products_request_representer'
require 'afterbuy/representer/get_shop_products_response_representer'
require 'afterbuy/representer/update_shop_products_request_representer'
require 'afterbuy/representer/update_shop_products_response_representer'
require 'afterbuy/representer/shop_interface_line_item_representer'
require 'afterbuy/representer/shop_interface_request_representer'
require 'afterbuy/representer/shop_interface_response_representer'

require 'afterbuy/api'

module Afterbuy
  include ActiveSupport::Configurable

  config_accessor(:partner_id)
  config_accessor(:partner_password)
  config_accessor(:user_id)
  config_accessor(:user_password)
  config_accessor(:afterbuy_api_url) { 'https://api.afterbuy.de/afterbuy/ABInterface.aspx' }
  config_accessor(:afterbuy_shop_interface_url) { 'https://api.afterbuy.de/afterbuy/ShopInterfaceUTF8.aspx' }
end
