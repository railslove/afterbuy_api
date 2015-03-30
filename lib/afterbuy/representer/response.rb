module Afterbuy
  class Response < OpenStruct
  end

  module Representer
    class ResponseRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Afterbuy

      property :CallStatus
      property :CallName
      property :VersionID
      nested :Result do
        include ResultRepresenter
      end
    end
  end
end
