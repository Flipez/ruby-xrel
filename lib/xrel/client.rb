autoload :Typhoeus, 'typhoeus'
autoload :Oj, 'oj'
module Xrel
  class Client
    attr_reader :api_base, :format
    def initialize
      @api_base = 'https://api.xrel.to/v2'
      @format = '.json'
    end

    def inspect
      "#<#{self.class}:#{object_id}>"
    end

    def get(url, params: {})
      request(url, :get, params: params)
    end

    private

    def request(url, method, body: nil, params: {}, headers: {})
      request = Typhoeus::Request.new(
          api_base + url + format,
          method: method,
          body: body,
          params: params,
          headers: headers
      )

      request.on_complete do |response|
        if response.success?
          parse_response_body(response.body)
        elsif response.timed_out?
          raise Xrel::Error::Generic::TimeOut
        elsif response.code == 0
          raise Xrel::Error::Generic::UnableToConnect
        else
          raise Xrel::Error::Generic::UnexpectedError
        end
      end
      request.run
    end

    def parse_response_body(body)
      Oj.load(body)
    end
  end
end