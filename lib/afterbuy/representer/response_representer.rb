module Afterbuy
  class Response < OpenStruct
  end

  module Representer
    class ResponseRepresenter < Roar::Decorator
      include Roar::XML

      self.representation_wrap = :Afterbuy

      property :call_status, as: :CallStatus
      property :call_name, as: :CallName
      property :version_id, as: :VersionID
      property :result, as: :Result, extend: ResultRepresenter, class: Result
    end
  end
end
