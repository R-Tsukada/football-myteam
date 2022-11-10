# frozen_string_literal: true

class StandingAccessLog
  include ActiveModel::Model
  include ActiveModel::Attributes

  def self.all
    StandingRequest.call
  end
end
