module TripDashboardFormatter

  def dashboard_data
    dates = ordered_dates_by_trip_count
    bikes = ordered_bikes_by_trip_count

    {
      average_duration: average(:duration),
      longest_trip: where(duration: maximum(:duration)),
      shortest_trip: where(duration: minimum(:duration)),

      most_common_starting_station: most_common_starting_station,
      most_common_ending_station: most_common_ending_station,

      most_rides_bike: bikes.first.first,
      most_rides_for_bike: bikes.first.last,
      least_rides_bike: bikes.last.first,
      least_rides_for_bike: bikes.last.last,

      most_rides_date: dates.first.first,
      most_rides_for_date: dates.first.last,
      least_rides_date: dates.last.first,
      least_rides_for_date: dates.last.last,

      subscription_type_breakout: subscription_type_breakout,
      year_month_breakout: year_month_breakout,

      most_rides_weather: most_rides_weather(dates).as_json(:whatever),
      most_rides_weather: least_rides_weather(dates).as_json(:whatever)
    }
  end

  def ordered_groups_by_trip_count(field)
    group(field).order("COUNT(id) DESC").count.to_a
  end

  def ordered_dates_by_trip_count
    ordered_groups_by_trip_count(:start_date)
  end

  def ordered_bikes_by_trip_count
    ordered_groups_by_trip_count(:bike_id)
  end

  def most_rides_weather(dates)
    find_by(start_date: dates.first.first).condition
  end

  def least_rides_weather(dates)
    find_by(start_date: dates.last.first).condition
  end

  def most_common_starting_station
    get_id = group(:start_station_id).order('count_id DESC').count(:id).first[0]
    Station.find(get_id).name
  end

  def most_common_ending_station
    get_id = group(:end_station_id).order('count_id DESC').count(:id).first[0]
    Station.find(get_id).name
  end

  def subscription_type_breakout
    total = count
    group('subscription_type').count.transform_values do |subtotal|
      {
        subtotal: subtotal,
        percentage: subtotal * 100 / total
      }
    end
  end

  def year_month_breakout
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

  def rides_per_month
    group('date_trunc("month", start_date)').count(:id)
  end

end
