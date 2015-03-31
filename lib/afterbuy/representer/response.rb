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
      property :Result, extend: ResultRepresenter, class: Result
    end
  end
end
