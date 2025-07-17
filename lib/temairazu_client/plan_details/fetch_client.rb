# frozen_string_literal: true

module TemairazuClient
  module PlanDetails
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetPlanDetailRQ
      end

      def response_root
        :GetPlanDetailRS
      end

      def dates
        (Date.current..1.year.from_now)
      end

      def extend_params(info)
        params = dates.map do |date|
          {
            PlanTypeCode: info[:plan].code,
            Date: date
          }
        end
        params.to_xml(skip_instruct: true, root: 'PlanList', skip_types: true, children: 'PlanDetailInfo')
      end
    end
  end
end
