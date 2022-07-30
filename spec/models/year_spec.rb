# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Year, type: :model do
  it 'this years western calendar if this month is August or later' do
    current_year = Time.zone.now.year
    if Time.zone.now.month <= 7
      expect(Year.season).to eq current_year - 1
    else
      expect(Year.season).to eq current_year
    end
  end
end
