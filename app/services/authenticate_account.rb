# frozen_string_literal: true

require 'http'

module TrackIt
  # Service that authenticate a given account
  class AuthenticateAccount
    class UnauthorizedError < StandardError; end

    def initialize(config)
      @config = config
    end

    def self.call(username:, password:)
      response = HTTP.post("#{@config.API_URL}/auth/authenticate",
                           json: { username:, password: })

      raise(UnauthorizedError) unless response.code == 200

      response.parse['attributes']
    end
  end
end
