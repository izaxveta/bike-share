# require './app/models/condition'
# require './spec/spec_helper'
#
# RSpec.describe Condition do
#   before{ Seed.seed_conditions }
#
#   it 'returns breakout incremented by chunk size'
#     expected = Condition.breakout(:mean_temperature_f, 10)
#     expect(expected).to eq "UNKNOWN"
#   end
#
#   it 'returns temperature breakout in 10 degree increments'
#     expected = Condition.temperature_breakout
#     expect(expected).to eq "UNKNOWN"
#   end
#
#   it 'returns precipitation breakout in 0.5 inch increments'
#     expected = Condition.precipitation_breakout
#     expect(expected).to eq "UNKNOWN"
#   end
#
#   it 'returns wind speed breakout in 4 degree increments'
#     expected = Condition.wind_speed_breakout
#     expect(expected).to eq "UNKNOWN"
#   end
#
#   it 'returns visibility breakout in 4 mile increments'
#     expected = Condition.visibility_breakout
#     expect(expected).to eq "UNKNOWN"
#   end
# end
