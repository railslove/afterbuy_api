module Afterbuy
  class TimeResponse < OpenStruct
  end

  module Representer
    class TimeResponseRepresenter < ResponseRepresenter
      property :result, as: :Result, class: Result do
        include ResultRepresenter

        property :afterbuy_timestamp, as: :AfterbuyTimeStamp
        property :afterbuy_universal_timestamp, as: :AfterbuyUniversalTimeStamp
      end
    end
  end
end
