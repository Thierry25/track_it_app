# frozen_string_literal: true

module TrackIt
  # Information regarding an organization
  class Organization
    attr_reader :id, :name, :logo, :country, :identifier

    def initialize(organization_info)
      @id = organization_info['data']['attributes']['id']
      @name = organization_info['data']['attributes']['name']
      @logo = organization_info['data']['attributes']['logo']
      @country = organization_info['data']['attributes']['country']
      @identifier = organization_info['data']['attributes']['identifier']
    end
  end
end
