# frozen_string_literal: true

require_relative 'organization'

module TrackIt
  # Information regarding a list of organizations
  class Organizations
    attr_reader :all

    def initialize(organizations_list)
      @all = organizations_list.map do |org|
        Organization.new(org)
      end
    end
  end
end
