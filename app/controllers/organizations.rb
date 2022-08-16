# frozen_string_literal: true

require 'roda'
require 'pry'

module TrackIt
  # Web Controller for TrackIt API
  class App < Roda
    route('organizations') do |routing|
      routing.on do
        routing.get do
          if @current_account.logged_in?
            organization_list = GetOwnedOrganizations.new(App.config).call(@current_account)

            organizations = Organizations.new(organization_list)

            view :organization_all, locals: { current_account: @current_account, organizations: }
          else
            routing.redirect '/auth/login'
          end
        end
      end
    end
  end
end
