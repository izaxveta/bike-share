require_relative 'dashboard_formatters/station'

class Station < ActiveRecord::Base
  extend StationDashboardFormatter

  has_many :trips_started, class_name: "Trip", foreign_key: :start_station_id, dependent: :destroy
  has_many :trips_ended, class_name: "Trip", foreign_key: :end_station_id, dependent: :destroy

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date,
                        :lat,
                        :long

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
