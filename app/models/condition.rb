class Condition < ActiveRecord::Base
  has_many :trips, primary_key: :date, foreign_key: :start_date

  validates_presence_of(
    :date,
    :max_temperature_f,
    :mean_temperature_f,
    :min_temperature_f,
    :mean_humidity,
    :mean_visibility_miles,
    :mean_wind_speed_mph,
    :precipitation_inches
  )


end
