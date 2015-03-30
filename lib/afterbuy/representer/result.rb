module Afterbuy
  module Representer
    module ResultRepresenter
      include Roar::XML

      collection :ErrorList, as: :Error, wrap: :ErrorList, extend: ErrorRepresenter, class: Error
      collection :WarningList, as: :Warning, wrap: :WarningList, extend: WarningRepresenter, class: Warning
    end
  end
end
