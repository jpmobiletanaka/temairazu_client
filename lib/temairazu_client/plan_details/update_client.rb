module TemairazuClient
  module PlanDetails
    class UpdateClient < TemairazuClient::Client
      private

      def request_root
        :UpdatePlanDetailRQ
      end

      def response_root
        :UpdatePlanDetailRS
      end

      def extend_params(params)
        params = params[:adjustments].map do |adjustment|
          {
            PlanTypeCode: adjustment.plan_code,
            RankCode: adjustment.rank_code,
            Date: adjustment.date.to_s,
            Type: (adjustment.absolute_value? ? 1 : 0),
            Amount: adjustment.amount,
            SalesClosed: (adjustment.sales_closed? ? 1 : 0)
          }
        end
        params.to_xml(skip_instruct: true, root: 'PlanList', skip_types: true, children: 'PlanDetailInfo')
      end
    end
  end
end