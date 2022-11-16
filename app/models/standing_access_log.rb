# frozen_string_literal: true

class StandingAccessLog
  include ActiveModel::Model
  include ActiveModel::Attributes

  def initialize
    @standing_request = StandingRequest.new
  end

  def all
    @standing_request.call
  end
end
