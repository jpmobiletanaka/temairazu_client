# frozen_string_literal: true

module TemairazuClient
  module Ranks
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetRankListRQ
      end

      def response_root
        :GetRankListRS
      end
    end
  end
end
