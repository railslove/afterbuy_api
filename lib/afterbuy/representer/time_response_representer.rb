module Afterbuy
  class TimeResponse < OpenStruct
  end

  module Representer
    class TimeResponseRepresenter < ResponseRepresenter
      property :result, as: :Result, extend: ResultRepresenter, class: Result do
        property :afterbuy_timestamp, as: :AfterbuyTimeStamp
        property :afterbuy_universal_timestamp, as: :AfterbuyUniversalTimeStamp
      end
    end
  end
end
