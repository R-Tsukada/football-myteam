# frozen_string_literal: true

class MatchAccessLog
  include ActiveModel::Model
  include ActiveModel::Attributes

  def self.all
    MatchRequest.league
  end
end
