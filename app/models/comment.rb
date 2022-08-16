# frozen_string_literal: true

module TrackIt
  # Information related to a comment
  class Comment
    attr_reader :id, :content

    def initialize(comment_info)
      @id = comment_info['attributes']['id']
      @content = comment_info['attributes']['content']
    end
  end
end
