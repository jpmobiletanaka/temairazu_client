module TemairazuClient
  module Prices
    class UpdateClient < TemairazuClient::Client
      private

      def request_root
        :UpdatePlanPriceRQ
      end

      def response_root
        :UpdatePlanPriceRS
      end

      def extend_params(params)
        Nokogiri::XML::Builder.new do |xml|
          xml.PlanList do
            xml.PlanPriceInfo do
              xml.PlanTypeCode_ params[:plan_code]
              xml.PricePerDays do
                params[:dates].each do |date, date_info|
                  xml.PricePerDay do
                    xml.Date_ date
                    xml.PricePerPersons do
                      date_info.each do |price, guest_count|
                        xml.PricePerPerson do
                          xml.Price_ price
                          xml.Person_ guest_count
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end.doc.root.to_xml
      end
    end
  end
end