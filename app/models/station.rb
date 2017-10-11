require_relative 'bike_share_queries'

class Station < ActiveRecord::Base
  extend BikeShareQueries

  has_many :trips_started, class_name: "Trip", foreign_key: :start_station_id, dependent: :destroy
  has_many :trips_ended, class_name: "Trip", foreign_key: :end_station_id, dependent: :destroy

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date,
                        :lat,
                        :long

  def self.names
    all.map(&:name).join(', ')
  end

  def self.with_most_bikes
    where dock_count: maximum(:dock_count)
  end

  def self.with_least_bikes
    where dock_count: minimum(:dock_count)
  end

  def self.newest
    where installation_date: maximum(:installation_date)
  end

  def self.oldest
    where installation_date: minimum(:installation_date)
  end

  def self.average_dock_count
    average(:dock_count).round
  end

  def self.maximum_dock_count
    maximum(:dock_count)
  end

  def self.minimum_dock_count
    minimum(:dock_count)
  end

  def started_rides_count
    trips_started.count
  end

  def ended_rides_count
    trips_ended.count
  end

  def frequent_destination
    station_id = trips_started.group("end_station_id").order("count_id DESC").count(:id).first[0]
    Station.find(station_id)
  end

  def frequent_destination_name
    frequent_destination.name
  end

  def frequent_origination
    station_id = trips_ended.group("start_station_id").order("count_id DESC").count(:id).first[0]
    Station.find(station_id)
  end

  def frequent_origination_name
    frequent_origination.name
  end

  def date_with_most_trips
    trips_started.group("start_date").order("count_id DESC").count(:id).first[0].strftime("%A %B %d %Y")
  end

  def most_common_user_zip_code
    trips_started.group("zip_code").order("count_id DESC").count(:id).first[0]
  end

  def most_common_bike_used
    trips_started.group("bike_id").order("count_id DESC").count(:id).first[0]
  end

end
