# frozen_string_literal: true

class StandingAndMatchAPI
  def self.request
    Match.delete_all
    Standing.delete_all
    binding.pry
    StandingAccessLog.all
    MatchAccessLog.all
  end
end
