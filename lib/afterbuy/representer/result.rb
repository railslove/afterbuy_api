module Afterbuy
  class Result < OpenStruct
  end

  module Representer
    class ResultRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Result

      collection :ErrorList, as: :Error, wrap: :ErrorList, extend: ErrorRepresenter, class: Error
      collection :WarningList, as: :Warning, wrap: :WarningList, extend: WarningRepresenter, class: Warning
    end
  end
end
