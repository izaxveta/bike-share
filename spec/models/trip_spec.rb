# require './app/models/trip'
# require './app/models/station'
# require './spec/spec_helper'
#
#
# RSpec.describe Trip do
#     before{ Seed.seed_trips }
#
#     it 'returns station with the most rides as a starting place' do
#       expected = Trip.starting_station_with_most_rides
#       expect(expected).to eq "UNKNOWN"
#     end
#
#
#     it 'returns station with the most rides as a ending place' do
#       expected = Trip.ending_station_with_most_rides
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns month by month breakdown of number of rides' do
#       expected = Trip.rides_per_month
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns  yearly subtotals for number of rides' do
#       expected = Trip.rides_per_year
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns most ridden bike' do
#       expected = Trip.top_rider
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns total number of rides per bike' do
#       expected = Trip.rides_per_top_rider
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns biker with fewest rides' do
#       expected = Trip.bottom_rider
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns biker with fewest rides' do
#       expected = Trip.rides_per_bottom_rider
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns user subscription count' do
#       expected = Trip.subscription_count
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns user subscription percentage' do
#       expected = Trip.subscription_percentage
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns user subscription type breakout with percentage' do
#       expected = Trip.subscription_type_breakout
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns a hash with the top year and month' do
#       expected = Trip.year_month_subtotals
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns single date with the highest number of trips' do
#       expected = Trip.most_active_date
#             expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns trips by the most active date' do
#       expected = Trip.trips_by_most_active_date
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns single date with the lowest number of trips' do
#       expected = Trip.least_active_date
#             expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns trips by the least active date' do
#       expected = Trip.trips_by_least_active_date
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns trips by the least active date' do
#       expected = Trip.trips_by_day
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns a count of trips per day' do
#       expected = Trip.count_of_trips_by_day
#       expect(expected).to eq "UNKNOWN"
#     end
#
#
# #These are AR-based methods which are doubles of existing methods. Not sure which to use.
#     it 'returns single date with the lowest number of trips' do
#       expected = Trip.single_date_with_highest_trips
#       expect(expected).to eq "UNKNOWN"
#     end
#
#     it 'returns single date with the lowest number of trips' do
#       expected = Trip.single_date_with_fewest_trips
#       expect(expected).to eq "UNKNOWN"
#     end
#
#   end
