require_relative 'dashboard_formatters/trip'

class Trip < ActiveRecord::Base
  extend TripDashboardFormatter

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


  def display
    "Trip ##{id} #{route} #{timeframe}"
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

end
