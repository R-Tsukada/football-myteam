# frozen_string_literal: true

class Competitor < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
