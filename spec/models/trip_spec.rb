require './app/models/trip'
require './app/models/station'
require './spec/spec_helper'


RSpec.describe Trip do
  before{ Seed.seed_trips }

  it 'returns station with the most rides as a starting place' do
    expected = Trip.starting_station_with_most_rides
    expect(expected).to eq "UNKNOWN"
  end


  it 'returns station with the most rides as a ending place' do
    expected = Trip.ending_station_with_most_rides
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns month by month breakdown of number of rides' do
    expected = Trip.rides_per_month
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns  yearly subtotals for number of rides' do
    expected = Trip.rides_per_year
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns most ridden bike' do
    expected = Trip.top_rider
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns total number of rides per bike' do
    expected = Trip.rides_per_bike
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns biker with fewest rides' do
    expected = Trip.bottom_rider
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns user subscription type breakout with percentage' do
    expected = Trip.subscription_count
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns user subscription type breakout with both count' do
    expected = Trip.subscription_percentage
    expect(expected).to eq "UNKNOWN"
  end

  it 'returns single date with the highest number of trips' do
    expected_1 = Trip.date_with_highest_trips
    expected_2 = Trip.date_with_highest_trips.count
    expect(expected_1).to eq "UNKNOWN"
    expect(expected_2).to eq "UNKNOWN"
  end

  it 'returns single date with the lowest number of trips' do
    expected_1 = Trip.date_with_lowest_trips
    expected_2 = Trip.date_with_lowest_trips.count
    expect(expected_1).to eq "UNKNOWN"
    expect(expected_2).to eq "UNKNOWN"
  end

end
