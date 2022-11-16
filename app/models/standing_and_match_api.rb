# frozen_string_literal: true

class StandingAndMatchAPI
  def self.request
    Match.delete_all
    Standing.delete_all
    StandingAccessLog.new.all
    MatchAccessLog.new.all
  end
end
