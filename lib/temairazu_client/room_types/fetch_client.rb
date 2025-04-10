module TemairazuClient
  module RoomTypes
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetRoomListRQ
      end

      def response_root
        :GetRoomListRS
      end

      def extend_params(params)
        params.merge(RoomInfo: { DataType: 1, Detail: true })
      end
    end
  end
end