require_relative 'bike_share_queries'

class Trip < ActiveRecord::Base
    extend BikeShareQueries

    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station,   class_name: "Station"
    belongs_to :condition, primary_key: :date, foreign_key: :start_date

    validates_presence_of :duration,
                          :start_date,
                          :start_station_id,
                          :end_date,
                          :end_station_id,
                          :bike_id,
                          :subscription_type
                          #do NOT validate zip code per Sal.


  def display
    "Trip ##{id} #{route}"
  end

  def route
    return "near #{start_station_name}" if round_trip?
    "from #{start_station_name} to #{end_station_name}"
  end

  def timeframe
    return "on #{start_date}" if same_day?
    "from #{start_date} to #{end_date}"
  end

  def round_trip?
    start_station_id == end_station_id
  end

  def same_day?
    start_date == end_date
  end

  def start_station_name
    start_station.name
  end

  def end_station_name
    end_station.name
  end








# NOTES - the two methods below are similar to the ones above. Not sure which to use.

  def self.single_date_with_highest_trips  #Single date with the highest number of trips with a count of those trips.
    group('start_date').order('count_id DESC').count(:id).first.first
  end

  def self.single_date_with_highest_trips_count
    group('start_date').order('count_id DESC').count(:id).first[-1]
  end

  def self.single_date_with_fewest_trips  #Single date with the highest number of trips with a count of those trips.
    group(:start_date).order('count_id ASC').count(:id).first.first
  end

  def self.single_date_with_fewest_trips_count
    group(:start_date).order('count_id ASC').count(:id).first[-1]
  end

  def self.condition_on_most_popular_day
    find_by(start_date: single_date_with_highest_trips).condition
  end

  def self.max_temperature_on_most_popular_day
    condition_on_most_popular_day.max_temperature_f
  end

  def self.mean_temperature_on_most_popular_day
    condition_on_most_popular_day.mean_temperature_f
  end

  def self.min_temperature_on_most_popular_day
    condition_on_most_popular_day.min_temperature_f
  end

  def self.mean_humidity_on_most_popular_day
    condition_on_most_popular_day.mean_humidity
  end

  def self.mean_visibility_on_most_popular_day
    condition_on_most_popular_day.mean_visibility_miles
  end

  def self.mean_wind_speed_on_most_popular_day
    condition_on_most_popular_day.mean_wind_speed_mph
  end

  def self.inches_of_precipitation_on_most_popular_day
    condition_on_most_popular_day.precipitation_inches
  end

  def self.condition_on_least_popular_day
    find_by(start_date: single_date_with_fewest_trips).condition
  end

  def self.max_temperature_on_least_popular_day
    condition_on_least_popular_day.max_temperature_f
  end

  def self.mean_temperature_on_least_popular_day
    condition_on_least_popular_day.mean_temperature_f
  end

  def self.min_temperature_on_least_popular_day
    condition_on_least_popular_day.min_temperature_f
  end

  def self.mean_humidity_on_least_popular_day
    condition_on_least_popular_day.mean_humidity
  end

  def self.mean_visibility_on_least_popular_day
    condition_on_least_popular_day.mean_visibility_miles
  end

  def self.mean_wind_speed_on_least_popular_day
    condition_on_least_popular_day.mean_wind_speed_mph
  end

  def self.inches_of_precipitation_on_least_popular_day
    condition_on_least_popular_day.precipitation_inches
  end

end
