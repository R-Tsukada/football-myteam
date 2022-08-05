# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Year, type: :model do
  it 'is displays last year if this month is before July' do
    travel_to Time.zone.local(2022, 7, 30) do
      expect(Year.season).to eq 2021
    end
  end

  it 'is displays this years western calendar if this month is July or later' do
    travel_to Time.zone.local(2022, 8, 1) do
      expect(Year.season).to eq 2022
    end
  end
end
