require_relative 'model'

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
    by_chunk field, step do |chunk|
      counts = chunk.child_counts_descending(:trip)
      {
        max: counts.first,
        min: counts.last,
        avg: counts.sum / counts.size
      }
    end
  end

end
