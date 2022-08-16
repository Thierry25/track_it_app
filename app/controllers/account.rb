# frozen_string_literal: true

require 'roda'
require_relative './app'

module TrackIt
  # Web controller for TrackIt API
  class App < Roda
    route('account') do |routing|
      routing.on do
        routing.public

        # GET /account/login
        routing.get String do |username|
          if @current_account && @current_account.username == username
            view :account, locals: { current_account: @current_account }
          else
            routing.redirect '/auth/login'
          end
        end

        # POST /account/<registration_token>
        routing.post String do |registration_token|
          raise 'Passwords do not match or empty' if
            routing.params['password'].empty? ||
            routing.params['password'] != routing.params['password_confirm']

          new_account = SecureMessage.decrypt(registration_token)
          CreateAccount.new(App.config).call(
            username: new_account['username'],
            first_name: new_account['first_name'],
            last_name: new_account['last_name'],
            email: new_account['email'],
            password: routing.params['password'],
            picture: routing.params['picture'],
            biography: routing.params['biography'],
            linkedin: routing.params['linkedin'],
            twitter: routing.params['twitter'],
            instagram: routing.params['instagram'],
            youtube: routing.params['youtube']
          )
          flash[:notice] = 'Account created! Please login'
          routing.redirect '/auth/login'
        rescue CreateAccount::InvalidAccount => e
          flash[:error] = e.message
          routing.redirect '/auth/register'
        rescue StandardError => e
          flash[:error] = e.message
          routing.redirect(
            "#{App.config.APP_URL}/auth/register/#{registration_token}"
          )
        end
      end
    end
  end
end
