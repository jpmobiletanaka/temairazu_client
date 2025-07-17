# frozen_string_literal: true

module TemairazuClient
  module RoomRanks
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetRoomRankRQ
      end

      def response_root
        :GetRoomRankRS
      end

      def extend_params(info)
        date = info[:date].to_date
        params = [
          {
            RoomTypeCode: info[:room_type].code,
            RoomTypeId: info[:room_type].room_type_id,
            Date: date.strftime('%Y-%m')
          }
        ]
        params.to_xml(skip_instruct: true, root: 'RoomRankList', skip_types: true, children: 'RoomRankInfo')
      end
    end
  end
end
