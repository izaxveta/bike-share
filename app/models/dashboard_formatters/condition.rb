module ConditionDashboardFormatter

  def dashboard_data
    {
      temperature_breakout: breakout(:mean_temperature_f, 10),
      precipitation_breakout: breakout(:precipitation_inches, 0.5),
      windspeed_breakout: breakout(:mean_wind_speed_mph, 4),
      visibility_breakout: breakout(:mean_visibility_miles, 4)
    }
  end

  def breakout(field, step)
    by_chunk(field, step) do |chunk|
      counts = trip_counts_descending
      {
        max: counts.first,
        min: counts.last,
        avg: (counts.sum / counts.size)
      }
    end
  end

  def trip_counts_descending(child_name)
    group(:id).joins(:trip).order("COUNT(trips.id) DESC").count.values
  end

  def order_by_trip_count

  end

  def by_chunk(field, step)
    start_group = minimum(field)
    last = maximum(field)
    final = {}
    until start_group > last
      end_group = start_group + step
      range = start_group...end_group
      final[range] = yield where(field => range)
      start_group = end_group
    end
    final
  end

end
