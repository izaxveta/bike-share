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



  def self.average_duration
    average :duration
  end

  def self.longest_trip
    where duration: (maximum :duration)
  end

  def self.shortest_trip
    where duration: (minimum :duration)
  end

  def self.starting_station_with_most_trips
    get_id = group(:start_station_id).order(start_station_id: :desc).count(:start_station_id).first.id
    Station.find(get_id).name
  end

  def self.ending_station_with_most_rides
    get_id = group(:end_station_id).order(end_station_id: :desc).count(:end_station_id).first[0]
    Station.find(get_id).name
  end

  def self.most_used_bike
    group('bike_id').order('bike_id ASC').count.first[0]
  end

  def self.rides_per_top_rider
    group('bike_id').order("bike_id ASC").count.first[1]
  end

  def self.bottom_rider
    group('bike_id').order('bike_id DESC').count.first[0]
  end

  def self.rides_per_bottom_rider
    group('bike_id').order("bike_id DESC").count.first[1]
  end

  def self.subscription_count
    count('subscription_type')
  end

  def self.subscription_percentage
    group('subscription_type').count
  end

  def self.subscription_type_breakout
    total = count
    var = group('subscription_type').count
    var2 = var.transform_values do |subtotal|
      {
        subtotal: subtotal,
        percentage: subtotal * 100 / total
      }
    end
  end

  def self.rides_per_month
    group("DATE_TRUNC('month', end_date)").count
  end

  def self.rides_per_year
    group("DATE_TRUNC('year', end_date)").count
  end

  def self.year_month_subtotals
    years = {}
    rides_per_month.each do |timestamp, month_count|
      y = timestamp.year
      years[y] ||= { "January"=> 0,  "February"=> 0, "March"=> 0,
                      "April"=> 0,   "May"=> 0,      "June"=> 0,
                      "July"=> 0,    "August"=> 0,   "September"=> 0,
                      "October"=> 0, "November"=> 0, "December"=> 0,
                      "Subtotal"=> 0 }
      m = timestamp.strftime('%B')
      years[y][m] += month_count
    end
    years.each_value { |counts| counts["Subtotal"] = counts.values.sum }
  end

  def self.most_active_date
    group("start_date").count.max_by(&:last)[0].strftime('%A, %B %d, %Y')
  end

  def self.trips_by_most_active_date
    group("start_date").count.max_by(&:last)[1]
  end

  def self.least_active_date
    group("start_date").count.min_by(&:last)[0].strftime('%A, %B %d, %Y')
  end

  def self.trips_by_least_active_date
    group("start_date").count.min_by(&:last)[1]
  end

  def self.trips_by_day
    Trip.group("start_date").order('start_date DESC').count.first
  end

  def self.trips_by_day
    group("start_date").count
  end
end
