require './app/models/station'
require './spec/spec_helper'

RSpec.describe Station do
  before { Seed.seed_stations }

    describe 'Station.names' do 
      it "returns the names of all current stations" do
        expected = Station.names.split(",").count

        expect(expected).to eq(9)
      end
      
      it "returns the names of all stations" do
        expected = Station.names
        
        expect(expected).to include("station")
      end
      
      it "returns the names of even more stations" do
        expected = Station.names
        
        expect(expected).to include("station")
      end
    end

    describe 'Station.with_most_bikes' do 
      it "returns station(s) with the most bike docks" do
        expected = Station.with_most_bikes

        expect(expected.count).to eq(1)
      end

      it "returns station(s) with the most bike docks that has id" do
        expected = Station.with_most_bikes.first

        expect(expected.id).to eq(9)
      end
    end

    describe 'Station.with_least_bikes' do 
      it "returns station(s) with the fewest bike docks" do
        expected = Station.with_least_bikes
        
        expect(expected.count).to eq(1)
      end

      it "returns station(s) with the fewest bike docks that has id" do
        expected = Station.with_least_bikes.first
        
        expect(expected.id).to eq(1)
      end
    end

    describe 'Station.newest' do 
      it "returns single most recently installed station by date" do
        expected = Station.newest

        expect(expected.count).to eq(1)
      end

      it "returns single most recently installed station that has an id" do
        expected = Station.newest.first

        expect(expected.id).to eq(9)
      end
    end

    describe 'Station.oldest' do 
      it "returns single earliest installed station by date" do
        expected = Station.oldest

        expect(expected.count).to eq(1)
      end

      it "returns single earliest installed station that has an id" do
        expected = Station.oldest.first

        expect(expected.id).to eq(1)
      end
    end

    describe 'Station.average_dock_count' do 
      it "returns average dock count among all stations " do

        expect(expected).to eq(18)
      end

      it "returns average dock count that is an integer" do
        expected = Station.average_dock_count

        expect(expected).should be_instance_of(Integer)
    end

    it 'Station.maximum_dock_count' do 
      it "returns highest number of docks of all the stations" do
        expected = Station.maximum_dock_count

        expect(expected).to eq(27)
      end

      it "returns highest number of docks of all the stations as an integer" do
        expected = Station.maximum_dock_count
        
        expect(expected).should be_instance_of(Integer)
      end
    end

    it 'Station.minimum_dock_count' do 
      it "returns lowest number of docks of all the stations" do
        expected = Station.minimum_dock_count

        expect(expected).to eq(11)
      end

      it "returns lowest number of docks of all the stations as an integer" do
        expected = Station.minimum_dock_count
        
        expect(expected).shoudl be_instance_of(Integer)
      end
    end

    it 'Station.started_rides_count' do 
      it "returns the number of rides that have started at that specific station" do
        expected = Station.first.started_rides_count

        expect(expected).to eq(9558)
      end
      
      it "returns the number of rides that have started at that station as an Integer" do
        expected = Station.first.started_rides_count

        expect(expected).should be_instance_of(Integer)
      end
    end

    it 'Station.ended_rides_count' do 
      it "returns the number of rides that have ended at that specific station" do
        expected = Station.first.ended_rides_count

        expect(expected).to eq(9415)
      end

      it "returns the number of rides that have ended at that specific station as an Integer" do
        expected = Station.first.ended_rides_count

        expected(expected).should be_instance_of(Integer)
      end
    end

    it 'Station.frequent_destination' do 
      it "returns most frequent end station" do
        expected = Station.first.frequent_destination

        expect(expected).should be_instance_of(Station)
      end

      it "returns the correct end station as most frequent end destination" do 
        expected = Station.first.frequent_destination

        expect(expected.id).to eq(4)
      end
    end

    it 'Station.frequent_destination_name' do 
      it "returns the name of the station's most frequent destination" do
        expected = Station.first.frequent_destination_name

        expect(expected).to eq("station")
      end
    end

    it 'Station.frequent_origination' do 
      it "returns station's most frequent trip origination station" do
        expected = Station.last.frequent_origination

        expect(expected).should be_instance_of(Station)
        expect(expected.id).to eq(80)
      end
    end

    it 'Station.frequent_origination_name' do 
      it "returns station name of a station's most frequent trip origination" do
        expected = Station.last.frequent_origination_name

        expect(expected).to eq("station")
      end
    end

    it 'Station.date_with_most_trips' do 
      it "returns a stations date with the most trips" do
        expected = Station.last.date_with_most_trips

        expect(expected).to eq("Saturday September 27 2014")
      end
    end

    it 'Station.most_common_user_zip_code' do 
      it "returns a stations most common user zip code" do
        expected = Station.last.most_common_user_zip_code

        expect(expected).to eq("95112")
        expect(expected).should be_instance_of(String)
      end
    end

    it 'Station.most_common_bike_used' do 
      it "returns id of a stations most commonly used bike" do
        expect = Station.first.most_common_bike_used

        expect(expected).to eq(65)
        expect(expected).should be_instance_of(Integer)
      end
    end
  end
end