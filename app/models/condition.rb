require_relative 'bike_share_queries'

class Condition < ActiveRecord::Base
  extend BikeShareQueries
  has_many :trips, primary_key: :date, foreign_key: :start_date

  validates_presence_of :date,
                        :max_temperature_f,
                        :mean_temperature_f,
                        :min_temperature_f,
                        :mean_humidity,
                        :mean_visibility_miles,
                        :mean_wind_speed_mph,
                        :precipitation_inches



  def breakout(field, chunk_size)
    super.breakout(:trips, field, chunk_size)
  end

  def temperature_breakout
    breakout(:mean_temperature_f, 10)
  end

  def precipitation_breakout
    breakout(:precipitation_inches, 0.5)
  end

  def wind_speed_breakout
    breakout(:mean_wind_speed_mph, 4)
  end

  def visibility_breakout
    breakout(:mean_visibility_miles, 4)
  end

end
