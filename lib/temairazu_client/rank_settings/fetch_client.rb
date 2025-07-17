# frozen_string_literal: true

module TemairazuClient
  module RankSettings
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetRankPriceRQ
      end

      def response_root
        :GetRankPriceRS
      end

      def extend_params(params)
        { RoomList: { RoomInfo: { RoomTypeCode: params[:room_type_code], RoomTypeId: params[:room_type_id] } } }
      end
    end
  end
end
