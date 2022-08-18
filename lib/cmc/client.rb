require 'faraday'
require 'faraday_middleware'

module Cmc
  class Client
    BASE_URL = 'sandbox-api.coinmarketcap.com'

    attr_reader :api_key, :adapter, :connection

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter
      end
    end

    def inspect
      `#<Cmc::Client>`
    end
  end
end
