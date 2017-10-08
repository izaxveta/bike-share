class Trip < ActiveRecord::Base
    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station,   class_name: "Station"

    validates_presence_of :duration,
                          :start_date,
                          :start_station_id,
                          :end_date,
                          :end_station_id,
                          :bike_id,
                          :subscription_type,
                          :zip_code

    def to_s
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

    group count DESC first
end