# frozen_string_literal: true

class MatchAccessLog
  include ActiveModel::Model
  include ActiveModel::Attributes

  def initialize
    @match_request = MatchRequest.new
  end

  def all
    @match_request.call
  end
end
