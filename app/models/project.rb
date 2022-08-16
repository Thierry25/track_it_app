# frozen_string_literal: true

module TrackIt
  # Information regarding a project
  class Project
    attr_reader :id, :name, :description, :url

    def initialize(project_info)
      @id = project_info['data']['attributes']['id']
      @name = project_info['data']['attributes']['name']
      @description = project_info['data']['attributes']['description']
      @url = project_info['data']['attributes']['url']
    end
  end
end
