# frozen_string_literal: true

require 'http'

module TrackIt
  # Returns an authenticated user, or nil
  class CreateAccount
    class InvalidAccount < StandardError; end

    def initialize(config)
      @config = config
    end

    def call(first_name:, last_name:, username:, email:, password:)
      message = { first_name:,
                  last_name:,
                  username:,
                  email:,
                  password: }

      response = HTTP.post(
        "#{@config.API_URL}/accounts/",
        json: message
      )

      raise InvalidAccount unless response.code == 201
    end
  end
end

# def call(username:, first_name:, last_name:, email:, password:, picture:, biography:, linkedin:, twitter:,
#          instagram:, youtube:)
#   message = { username:,
#               first_name:,
#               last_name:,
#               email:,
#               password:,
#               picture:,
#               biography:,
#               linkedin:,
#               twitter:,
#               instagram:,
#               youtube: }
