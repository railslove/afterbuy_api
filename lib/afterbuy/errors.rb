module Afterbuy

  class ABError < StandardError
  end

  class ConfigMissingPartnerIDError < ABError
  end

  class ConfigMissingPartnerPasswordError < ABError
  end

  class ConfigMissingUserIDError < ABError
  end

  class ConfigMissingUserPasswordError < ABError
  end

end
