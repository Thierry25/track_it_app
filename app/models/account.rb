# frozen_string_literal: true

module TrackIt
  # Information regarding an account
  class Account
    def initialize(account_info, auth_token)
      @account_info = account_info
      @auth_token = auth_token
    end

    attr_reader :account_info, :auth_token

    def username
      @account_info ? @account_info['username'] : nil
    end

    def email
      @account_info ? @account_info['email'] : nil
    end

    def picture
      @account_info ? @account_info['picture'] : nil
    end

    def first_name
      @account_info ? @account_info['first_name'] : nil
    end

    def last_name
      @account_info ? @account_info['last_name'] : nil
    end

    def biography
      @account_info ? @account_info['biography'] : nil
    end

    def linkedin
      @account_info ? @account_info['linkedin'] : nil
    end

    def instagram
      @account_info ? @account_info['instagram'] : nil
    end

    def twitter
      @account_info ? @account_info['twitter'] : nil
    end

    def youtube
      @account_info ? @account_info['youtube'] : nil
    end

    def created_at
      @account_info ? @account_info['created_at'] : nil
    end

    def logged_out?
      @account_info.nil?
    end

    def logged_in?
      !logged_out?
    end
  end
end
