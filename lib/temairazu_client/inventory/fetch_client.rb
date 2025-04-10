module TemairazuClient
  module Inventory
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetRoomStockRQ
      end

      def response_root
        :GetRoomStockRS
      end

      def dates
        (Date.current..1.year.from_now)
      end

      def extend_params(params)
        Nokogiri::XML::Builder.new do |xml|
          xml.RoomStockList do
            dates.map do |date|
              xml.RoomStockInfo do
                xml.RoomTypeCode params[:room_type_code]
                xml.Date date.to_s
                xml.Detail true
              end
            end
          end
        end.doc.root.to_xml
      end
    end
  end
end