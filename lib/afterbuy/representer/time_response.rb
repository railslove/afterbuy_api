module Afterbuy
  class TimeResponse < OpenStruct
  end

  module Representer
    class TimeResponseRepresenter < ResponseRepresenter
      property :Result, extend: ResultRepresenter, class: Result do
        property :AfterbuyTimeStamp
        property :AfterbuyUniversalTimeStamp
      end
    end
  end
end
