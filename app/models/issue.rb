# frozen_string_literal: true

module TrackIt
  # Information regarding an issue
  class Issue
    attr_reader :id, :ticket_number, :type, :priority, :status, :description, :title, :completed

    def initialize(issue_info)
      @id = issue_info['data']['attributes']['id']
      @ticket_number = issue_info['data']['attributes']['ticket_number']
      @type = issue_info['data']['attributes']['type']
      @priority = issue_info['data']['attributes']['priority']
      @status = issue_info['data']['attributes']['status']
      @description = issue_info['data']['attributes']['description']
      @title = issue_info['data']['attributes']['title']
      @completed = issue_info['data']['attributes']['completed']
    end
  end
end
