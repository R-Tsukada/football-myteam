# frozen_string_literal: true

class Year < ApplicationRecord
  def self.season
    current_year = Time.zone.now.year
    current_month = Time.zone.now.month
    current_month <= 7 ? current_year - 1 : current_year
  end
end
