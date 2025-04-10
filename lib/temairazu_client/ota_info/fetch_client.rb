module TemairazuClient
  module OtaInfo
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetOtaListRQ
      end

      def response_root
        :GetOtaListRS
      end
    end
  end
end