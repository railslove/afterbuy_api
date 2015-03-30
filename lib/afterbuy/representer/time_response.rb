module Afterbuy
  class TimeResponse < OpenStruct
  end

  module Representer
    class TimeResponseRepresenter < ResponseRepresenter
      nested :Result do
        include ResultRepresenter

        property :AfterbuyTimeStamp
        property :AfterbuyUniversalTimeStamp
      end
    end
  end
end
