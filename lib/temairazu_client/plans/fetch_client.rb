module TemairazuClient
  module Plans
    class FetchClient < TemairazuClient::Client
      private

      def request_root
        :GetPlanListRQ
      end

      def response_root
        :GetPlanListRS
      end

      def extend_params(params)
        params.merge(PlanInfo: { Detail: true })
      end
    end
  end
end