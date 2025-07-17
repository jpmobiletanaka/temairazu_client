# frozen_string_literal: true

module TemairazuClient
  module RoomRanks
    class UpdateClient < TemairazuClient::Client
      private

      def request_root
        :UpdateRoomRankRQ
      end

      def response_root
        :UpdateRoomRankRS
      end

      def extend_params(params)
        Nokogiri::XML::Builder.new do |xml|
          xml.RoomRankList do
            params[:dates].each do |date, rank_code|
              xml.RoomRankInfo do
                xml.RoomTypeCode params[:room_type_code]
                xml.RoomTypeId params[:room_type_id]
                xml.Date date
                xml.RankCode rank_code
              end
            end
          end
        end.doc.root.to_xml
      end
    end
  end
end
