module TemairazuClient
  module Prices
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        sc_account.test_account? ? :GetPlanPrice2RQ : :GetPlanPriceRQ
      end

      def response_root
        sc_account.test_account? ? :GetPlanPrice2RS : :GetPlanPriceRS
      end

      def extend_params(info)
        date = info[:date].to_date
        params = [
          {
            PlanTypeCode: info[:plan].code,
            Date: date.strftime('%Y-%m')
          }
        ]
        params.to_xml(skip_instruct: true, root: 'PlanList', skip_types: true, children: 'PlanPriceInfo')
      end
    end
  end
end