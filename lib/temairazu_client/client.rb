# frozen_string_literal: true

module TemairazuClient
  class Client
    TEMAIRAZU_URL = 'https://api.temairazu.net/rmsup'
    TIMEOUT = 60

    def initialize(sc_account)
      @sc_account = sc_account
    end

    def call(params)
      raise TemairazuClient::Error, 'Wrong account' unless sc_account.enabled?

      extended_params = safe_extend_params(params)
      pms_xml = prepare_params(extended_params, request_root)
      response = ::HTTParty.post(TEMAIRAZU_URL, body: { PMS_XML: pms_xml }, timeout: TIMEOUT)
      parsed_response = ::Ox.load(response.body.gsub(/&(?!amp;)/, '&amp;'), mode: :hash_no_attrs, effort: :auto_define)
      extract_response_body(parsed_response)
    end

    private

    attr_reader :sc_account

    def safe_extend_params(params)
      respond_to?(:extend_params, true) ? extend_params(params) : params
    end

    def extract_response_body(response)
      response[response_root] || response[:Error]
    end

    def prepare_params(params, root)
      login_info = {
        LoginInfo: {
          UserId: sc_account.sc_user_id,
          Password: sc_account.sc_password,
          PartnerId: sc_account.sc_system_id,
          PartnerPassword: sc_account.sc_system_password
        }
      }
      return login_info.merge(params).to_xml(root: root) if params.is_a?(Hash)

      doc = Nokogiri::XML(login_info.to_xml(root: root))
      doc.at(root).add_child(params.to_s)
      doc.to_xml
    end
  end
end
