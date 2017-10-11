require_relative 'model'

class TripDashboardFormatter

  def dashboard_data
    dates_by_trip_count = ordered_groups_by_count(:start_date).to_a
    bikes_by_trip_count = ordered_groups_by_count(:bike_id).to_a

    {
      average_duration: average :duration,
      longest_trip: where(maximum :duration),
      shortest_trip: where(minimum :duration),
      most_common_starting_station: most_common_starting_station,
      most_common_ending_station: most_common_ending_station,
      most_ridden_bike: bikes_by_trip_count.first,
      least_ridden_bike: bikes_by_trip_count.last,
      most_rides_date: dates_by_trip_count.first,
      least_rides_date: dates_by_trip_count.last,
      subscription_type_breakout: subscription_type_breakout,
      year_month_breakout: year_month_breakout
    }
  end

  def self.most_common_starting_station
    get_id = group(:start_station_id).order('count_id DESC').count(:id).first[0]
    Station.find(get_id).name
  end

  def self.most_common_ending_station
    get_id = group(:end_station_id).order('count_id DESC').count(:id).first[0]
    Station.find(get_id).name
  end

  def self.subscription_type_breakout
    total = count
    group('subscription_type').count.transform_values do |subtotal|
      {
        subtotal: subtotal,
        percentage: subtotal * 100 / total
      }
    end
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
      years[y][subtotal] += month_count
    end
  end

end
