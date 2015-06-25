module Afterbuy

  class APIError < StandardError
  end

  class ConfigError < StandardError
  end

  class ConfigMissingPartnerIDError < ConfigError
  end

  class ConfigMissingPartnerPasswordError < ConfigError
  end

  class ConfigMissingUserIDError < ConfigError
  end

  class ConfigMissingUserPasswordError < ConfigError
  end

end
