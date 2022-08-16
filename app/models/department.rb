# frozen_string_literal: true

module TrackIt
  # Information related to a department within an organization
  class Department
    attr_reader :id, :name

    def initialize(department_info)
      @id = department_info['data']['attributes']['id']
      @name = department_info['data']['attributes']['name']
    end
  end
end
