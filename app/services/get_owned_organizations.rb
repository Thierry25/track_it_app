# frozen_string_literal: true

require 'http'

# Returns all organizations belonging to an account
class GetOwnedOrganizations
  def initialize(config)
    @config = config
  end

  def call(current_account)
    response = HTTP.auth("Bearer #{current_account.auth_token}")
                   .get("#{@config.API_URL}/organizations")

    response.code == 200 ? JSON.parse(response.to_s)['data'] : nil
  end
end
