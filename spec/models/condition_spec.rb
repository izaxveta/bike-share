require './app/models/condition'
require './spec/spec_helper'

RSpec.describe Condition do
  before{ Seed.seed_conditions }

  it 'returns breakout incremented by chunk size' do
    expected = Condition.breakout(:mean_temperature_f, 10)
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns temperature breakout in 10 degree increments' do
    expected = Condition.temperature_breakout
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns precipitation breakout in 0.5 inch increments' do
    expected = Condition.precipitation_breakout
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns wind speed breakout in 4 degree increments' do
    expected = Condition.wind_speed_breakout
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns visibility breakout in 4 mile increments' do
    expected = Condition.visibility_breakout
    expect(expected).to eq "UNKNOWN"
  end
end
